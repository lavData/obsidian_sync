![[Pasted image 20240313114932.png]]
API Airbyte có 2 loại: [Detail](https://docs.airbyte.com/api-documentation) 
- Public API
- Private API → Dùng cái này, mặc dù "Airbyte does NOT have active commitments to support this API long-term. Users utilize the Config API, at their own risk" nhưng có đầy đủ các API để manipulate với các object trong Airbyte, cũng như không cần maintain Public API (bởi vì Public API là một service tách biệt, không chung với Airbyte Server). Chưa chốt
Meta router đóng vai trò như một handler xử lí các request của WebApp và đưa cho Airbyte Server, hạn chế tối đa việc tự quản lý state của các Object trong Airbyte, hiện tại chỉ quản lý phần boundary config cho Destination Connector.
# Create Destination
![[Pasted image 20240313115131.png]]
- Get all destination connector
- Show UI from config of connector
- Run check and post config if check success.

## Get all destination connector

Q: Lấy tất cả các connector mà Airbyte đang support hay chỉ lấy những connector mà mình chỉ định sẵn thôi?

A: Lựa chọn tạm thời là chỉ định sẵn, như (Clevertap Destination, Google Sheet Destination)

I (Implement): Có 2 phương án

- Dùng list all destination rồi (chỉ có param filter includeDeleted) rồi phải lấy về dùng name connector để lọc (ví dụ như: WhiteLabel-*, WhiteLabel-Clevertap)
    
    [Source API](https://reference.airbyte.com/reference/listdestinations)
    
    ```bash
    curl --request GET \\
         --url <https://api.airbyte.com/v1/destinations> \\
         --header 'accept: application/json'
    ```
    
- Dùng get destination, params là UUID của destination connector đó.
    
    [Source API](https://reference.airbyte.com/reference/getdestination)
    
    ```bash
    curl --request GET \\
         --url <https://api.airbyte.com/v1/destinations/destinationId> \\
         --header 'accept: application/json'
    ```
    

## Show UI from config connector

🚧 Warning: Mình phải If-else cho case CT destination khi show UI config? Bởi vì config của CT có chia theo gửi theo `Segment` hay `Profile`, nhưng theo design là phần chọn `Segment` hay `Profile` thì được config khi chạy sync. 
🚀 Solution: Lưu một metadata chứa các field nào cần show khi tạo Destination.

Implement: Copy code formatter UI from config của Airbyte Webapp.

## Run check and post config if check success.
💪 Một strong factor nữa về việc không nên chia config của connector thành 2 phần, mà chỉ config ở bước create destination mà thôi.
### General connector
Dùng [API create destination](https://reference.airbyte.com/reference/createdestination) fail thì báo lỗi, success thì lưu trong database của Airbyte
💡Dùng prefix name để xác định được connector nào được quản lí bởi Airbyte WhiteLabel. Ví dụ WhiteLabel-CleverTap, WhiteLabel-GoogleSheet
[Source API](https://reference.airbyte.com/reference/createdestination)
```Shell
curl --request POST \
     --url https://api.airbyte.com/v1/destinations \
     --header 'accept: application/json' \
     --header 'content-type: application/json' \
     --data '
{
  "configuration": {
    "destinationType": "google-sheets"
  }
}

```
### Side Effect
Riêng với CleverTap, design trong figma hiện tại config bị chia thành 2 phần, 1 phần tạm gọi là config Universal (ID, passcode, region), config còn lại thì được chọn khi sync (data sync option) ❗ Điều này sẽ khiến với mỗi lần sync, khi ta chọn CT sync đi event hay profile thì nó đã thay đổi config cho toàn bộ sync có CT.
Vậy ở bước này cần làm gì?  ❓ Move phần Sync option (Events, Profile) sang cho Transfomer Module, làm cho CleverTap Destination generic nhất.

# Create Sync

- Select model
- Select Destinatiojn
- Configure sync
## Select Model
![[Pasted image 20240313141451.png]]
Bước này ngầm định là tạo một connector Source PrimeData **MỚI**, nghĩa là với mỗi lần sync ta phải tạo một connector Source PrimeData. 
Information: Các config được dùng ở bước này là lựa chọn sync options
- Events
	- Event Type
	- Start Time - End Time
- Profiles
	- List Segment ❓
💡Vẫn còn các config về transform, filter sẽ được update ở phần Configure sync, nghĩa là ở bước Select model ta sẽ tạo connector với các config như trên, ở bước Configure sync sẽ update các config transform. 
Implement: Khác với tạo Destination Connector (UI sẽ follow vào spec Connector Definition),l thìll ở phần này, các config sẽ được Front-End hard code cách hiển thị và tên field trong config. Khi bấm **Continue**, sẽ dùng API Create Source, keep source
[Source API](https://airbyte-public-api-docs.s3.us-east-2.amazonaws.com/rapidoc-api-docs.html#post-/v1/sources/create)
## Select Destination
![[Pasted image 20240313141402.png]]
Chọn Destination cho việc sync. Chỉ lấy các Destination Instant được tạo từ Airbyte WhiteLable
Implement: Dùng API List configured destinations for a workspace và filter các Destination nào có name với prefix nào là WhiteLabel-
[Source API](https://airbyte-public-api-docs.s3.us-east-2.amazonaws.com/rapidoc-api-docs.html#post-/v1/destinations/list)

## Configure Sync
![[Pasted image 20240313151922.png]]
Nhiệm vụ chính của phần này là chọn property nào để sync hoặc rename property. Vậy flow như sau: Discover Source → Lấy các properties show ở UI → Convert các transform này thành jq (nhiệm vụ của Prime BackEnd) → Update Source PrimeData bằng configs transform mới này. → Tạo connectio
Implement: 
- Discover Schema Source dùng API [Discover the schema catalog of the source](https://airbyte-public-api-docs.s3.us-east-2.amazonaws.com/rapidoc-api-docs.html#post-/v1/sources/discover_schema), dùng response trả về để save Schema này [Auto propagate the change on a catalog to a catalog saved in the DB](https://airbyte-public-api-docs.s3.us-east-2.amazonaws.com/rapidoc-api-docs.html#post-/v1/sources/apply_schema_changes) . Vây còn các config như: Sync Mode, Cursor field?
	- Hard code trước khi save Schema
	- Hoặc alter code ở Source PrimeData sẽ return default Sync Mode, thì phần code ở Airbyte WhiteLabel chỉ cần get response từ discover và saved thôi.
- Các properties lấy từ Discover response sẽ dùng để show trên UI và transform, từ đó update Source PrimeData một lần nữa với option transform jq filter [Update a source](https://airbyte-public-api-docs.s3.us-east-2.amazonaws.com/rapidoc-api-docs.html#post-/v1/sources/update)
-  Tạo connection bằng cách dùng AP [Create a connection between a source and a destination](https://airbyte-public-api-docs.s3.us-east-2.amazonaws.com/rapidoc-api-docs.html#post-/v1/connections/create). Note: name của connection sẽ là segment name
# Manage Sync

- Get all connection
