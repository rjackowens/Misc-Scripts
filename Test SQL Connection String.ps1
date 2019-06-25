$connectionString = "Data Source=SERVER;Initial Catalog=TEST;Integrated Security=true"

$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
$connection.Open()
$connection.Close()
