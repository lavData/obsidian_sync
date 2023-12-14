# Buổi 1: Nắm sơ bộ mô hình sync dữ liệu qua các destination & cách thực hiện trên UI;Mô hình integrate dữ liệu vào CDP.  
![[Simple model]]
![[Data source]]
![[Model data]]![[Excalidraw/Airbyte]]
![[Staging]]
Trong primedata có 2 thực thể chính: 

Khi event đi vào primedata được unify profile và segment hoá thì có nhu cầu engagement thì cần đẩy lượng data này vào Clevertap.


Các connector:
1. SQL source 
2. Primedata destination
3. Primedata source
4. Clevertap source
## Operate trên UI
https://integration.live.primedatacdp.com/workspaces/28079d89-0b17-4ebd-93a0-7ab7575b6624/connections

# Mô hình data
SQL: Table order-> event orderCreated, orderCompleted, orderCan -> primedata.

eventName: ...
timeStamp:...
properties: {
	order_id: ...
	customer_id: ...
	items::... 
	customer_name: ...
}

profile: {
properties1: ...,
properties2: 
}

rule {
phone_number -> 1
email:
customer_id: 
}

# Buổi 2: Nắm các logic cụ thể của tính năng sync data qua destination CT  
PrimeDataSource: 
- Events
	- EventName: OrderCreated, OderCompleted -> All
	- StartTime: TimeStamp -> Indicate thời bắt đầu ->> WHERE 
	- Jq transform: {a: 1} -> del(a) -> {}
	- Jq filter:  0 được có field a -> events -> airbyte
- Profiles:
	-  Tạo segment trên primedata -> profile có đơn hàng trong 3000 ngày -> segmentId
	- a,b,c,d -> 2ZQUbAtKczLmsJ2b4xHCqq1SZjk -> ...
	-  OrderCreated -> {
 "a":...
 "b": ... 
 profiles : {
 "pro1": ...
 "pro2": ..
 }
	- }
	OrderCompleted: {
	 "a": 100
	 "b": 200,
	 "c": 300,
	}
	del(a), d: "...", CRUD, JQ FILTER

Primedata source -> JSON -> Airbyte -> JSON -> Clevertap destination (gọi API).
-> clevertap demo project ->
Dev -> debug -> 0 send CT -> log 
Lấy code về máy mình chạy (Dev)
Primedata source -> debug -> log -> 
Primedatsource -> Postgres Destination (của mình ) ->  row -> event, profiles 
https://www.notion.so/primedata/PrimeData-Source-Standard-4e2a1bf7f6574d9fad47b7e2caf4ca6d#b582fbea10e54fcdbadfc71ecf27f03f

# Buổi 3: Cụ thể tính năng cần test