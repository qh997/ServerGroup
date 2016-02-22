$TTL 3600

@	IN	SOA	gateway.home.qh997.com. qh997.hotmail.com. (
			997
			604800
			86400
			2419200
			604800
)
@	IN	NS	gateway.home.qh997.com.
gateway	A	10.3.8.1
ns	A	10.3.8.1
archive	A	10.3.8.10
