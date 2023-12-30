# dremio nessie learning


##  Spark with nessie  

> with spark 3.5

* spark config

conf/spark-defaults.conf

```code
spark.sql.extensions               org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions,org.projectnessie.spark.extensions.NessieSparkSessionExtensions
spark.sql.catalog.nessie.warehouse s3a://myws/   
# spark.sql.catalog.nessie.type      rest
spark.sql.catalog.nessie.uri       http://localhost:19120/api/v1
spark.sql.catalog.nessie.ref       main
spark.sql.catalog.nessie.authentication.type NONE
spark.sql.catalog.nessie.s3.endpoint    http://localhost:9000
spark.sql.catalog.nessie.catalog-impl   org.apache.iceberg.nessie.NessieCatalog
# spark.sql.catalog.nessie.io-impl       org.apache.iceberg.aws.s3.S3FileIO
spark.sql.catalog.nessie               org.apache.iceberg.spark.SparkCatalog
spark.hadoop.fs.s3a.access.key          minio
spark.hadoop.fs.s3a.secret.key          minio123
spark.hadoop.fs.s3a.endpoint            http://localhost:9000
spark.hadoop.fs.s3a.path.style.access   true
```

* starting command

> must add correct hadoop-aws version

```code

./bin/spark-sql \
  --packages "org.apache.iceberg:iceberg-spark-runtime-3.5_2.12:1.4.0,org.projectnessie.nessie-integrations:nessie-spark-extensions-3.5_2.12:0.75.0,org.apache.hadoop:hadoop-aws:3.3.3"
```

* create table && insert datas

```code
CREATE TABLE nessie.namesv2
(
  name string
) using iceberg;

insert into nessie.namesv2 values('dalongdemo');

```

