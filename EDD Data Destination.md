# Create Destination

- Get all destination connector
- Show UI from config of connector
- Run check and post config if check success.

## Get all destination connector

Q: Lấy tất cả các connector mà Airbyte đang support hay chỉ lấy những connector mà mình chỉ định sẵn thôi?

A: Lựa chọn tạm thời là chỉ định sẵn, như (Clevertap Destination, Google Sheet Destination)

I (Implement): Có 2 phương án

- Dùng list all destination rồi (chỉ có param filter includeDeleted) rồi phải lấy về dùng name connector để lọc (ví dụ như: ForWhiteLabel-*, ForWhiteLabel-Clevertap)
    
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
🚀 Solution: 
### Clevertap Destination



## Get all destination connector

# Create Sync

- Select model
- Select Destination
- Configure sync

# Manage Sync

- Get all connection

# Concepts
## Connector config
Sẽ chia thành 2 loại config: 
- Config Authenticate, timeZone (initial config)
- Object config hay Dynamic Config (sẽ được config khi setup sync)
Lý do: có nhu cầu dynamic 