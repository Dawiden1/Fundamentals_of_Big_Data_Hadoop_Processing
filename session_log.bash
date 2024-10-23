Linux big-data-cluster-m 6.1.0-26-cloud-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.112-1 (2024-09-30) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Tue Oct 22 21:06:51 2024 from 35.235.240.193
dawiden1@big-data-cluster-m:~$ ls -l
total 16
-rwxr-xr-x 1 dawiden1 dawiden1  877 Oct 22 21:56 combiner.py
drwxr-xr-x 2 dawiden1 dawiden1 4096 Oct 22 21:12 datasource1
-rwxr-xr-x 1 dawiden1 dawiden1  691 Oct 22 22:01 mapper.py
-rwxr-xr-x 1 dawiden1 dawiden1 2018 Oct 22 21:55 reducer.py
dawiden1@big-data-cluster-m:~$ adoop fs -copyToLocal gs://bd-wsb-24-09-dm/projekt1/input.csv
-bash: adoop: command not found
dawiden1@big-data-cluster-m:~$ hadoop fs -copyToLocal gs://bd-wsb-24-09-dm/projekt1/input.csv
2024-10-22 22:08:06,370 INFO impl.MetricsConfig: Loaded properties from hadoop-metrics2.properties
2024-10-22 22:08:06,470 INFO impl.MetricsSystemImpl: Scheduled Metric snapshot period at 10 second(s).
2024-10-22 22:08:06,470 INFO impl.MetricsSystemImpl: google-hadoop-file-system metrics system started
Oct 22, 2024 10:08:07 PM com.google.cloud.hadoop.repackaged.gcs.com.google.cloud.hadoop.util.RequestTracker stopTracking
INFO: Detected high latency for [url=https://storage.googleapis.com/storage/v1/b/bd-wsb-24-09-dm/o?delimiter=/&fields=items(bucket,name,timeCreated,updated,generation,metageneration,size,contentType,contentEncoding,md5Hash,crc32c,metadata),prefixes,nextPageToken&includeTrailingDelimiter=true&maxResults=1&prefix=projekt1/input.csv/; invocationId=gl-java/11.0.20 gdcl/2.1.1 linux/6.1.0 gccl-invocation-id/7216edbb-ef85-4216-9fa6-e96644131084]. durationMs=202; method=GET [CONTEXT ratelimit_period="10 SECONDS [skipped: 1]" ]
Oct 22, 2024 10:08:07 PM com.google.cloud.hadoop.fs.gcs.GhfsGlobalStorageStatistics trackDuration
INFO: periodic connector metrics: {gcs_api_time=403, gcs_api_total_request_count=2, gcs_connector_time=586, gcs_list_file_request=1, gcs_list_file_request_max=202, gcs_list_file_request_mean=202, gcs_list_file_request_min=202, gcs_metadata_request=1, gcs_metadata_request_max=201, gcs_metadata_request_mean=201, gcs_metadata_request_min=201, gs_filesystem_create=2, gs_filesystem_initialize=1, op_get_file_status=1, op_get_file_status_max=586, op_get_file_status_mean=586, op_get_file_status_min=586, op_glob_status=1, uptimeSeconds=1} [CONTEXT ratelimit_period="5 MINUTES" ]
dawiden1@big-data-cluster-m:~$ ls -l
total 48
-rwxr-xr-x 1 dawiden1 dawiden1   877 Oct 22 21:56 combiner.py
drwxr-xr-x 2 dawiden1 dawiden1  4096 Oct 22 21:12 datasource1
-rw-r--r-- 1 dawiden1 dawiden1 30957 Oct 22 22:08 input.csv
-rwxr-xr-x 1 dawiden1 dawiden1   691 Oct 22 22:01 mapper.py
-rwxr-xr-x 1 dawiden1 dawiden1  2018 Oct 22 21:55 reducer.py
dawiden1@big-data-cluster-m:~$ cat input.csv | ./mapper.py
1       20000,27
3       4000,26
4       650,18
3       500,22
5       2000,35
2       500,20
4       1000,32
2       500,21
2       500,21
6       15000,27
3       650,21
1       28000,32
2       2000,23
6       2000,25
1       59000,31
3       2000,20
6       3000,28
6       4000,19
8       1000,25
3       2000,22
        ,34
8       2000,18
5       2000,21
4       2000,30
6       500,17
3       2000,21
3       3000,22
6       500,19
3       3000,31
5       1000,19
3       9000,27
8       850,21
6       3000,23
1       2000,18
6       1000,20
3       2000,27
6       3000,26
6       500,18
6       6000,20
3       500,25
8       3000,25
6       3000,18
4       1000,24
3       2000,27
4       950,26
1       5000,26
3       3000,22
6       2000,19
4       10000,25
5       1000,19
8       500,19
7       15000,29
8       2000,21
dawiden1@big-data-cluster-m:~$ cat input.csv | ./mapper.py | sort -k1,1 | ./combiner.py
1       114000,134,5
2       3500,85,4
3       33650,313,13
4       15600,155,6
5       6000,94,4
6       43500,279,13
7       15000,29,1
8       9350,129,6
dawiden1@big-data-cluster-m:~$ cat input.csv | ./mapper.py | sort -k1,1 | ./combiner.py | sort -k1,1 | ./reducer.py
1       22800,26,5
2       875,21,4
3       2588,24,13
4       2600,25,6
5       1500,23,4
6       3346,21,13
7       15000,29,1
8       1558,21,6
dawiden1@big-data-cluster-m:~$ ls -l
total 48
-rwxr-xr-x 1 dawiden1 dawiden1   877 Oct 22 21:56 combiner.py
drwxr-xr-x 2 dawiden1 dawiden1  4096 Oct 22 21:12 datasource1
-rw-r--r-- 1 dawiden1 dawiden1 30957 Oct 22 22:08 input.csv
-rwxr-xr-x 1 dawiden1 dawiden1   691 Oct 22 22:01 mapper.py
-rwxr-xr-x 1 dawiden1 dawiden1  2018 Oct 22 21:55 reducer.py
dawiden1@big-data-cluster-m:~$ hadoop jar /usr/lib/hadoop/hadoop-streaming.jar     -input input     -output output     -mapper mapper.py     -reducer reducer.py     -combiner combiner.py     -file mapper.py     -file reducer.py     -file combiner.py
2024-10-22 22:10:11,319 WARN streaming.StreamJob: -file option is deprecated, please use generic option -files instead.
packageJobJar: [mapper.py, reducer.py, combiner.py] [/usr/lib/hadoop/hadoop-streaming-3.3.6.jar] /tmp/streamjob5652985752076823721.jar tmpDir=null
2024-10-22 22:10:12,609 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at big-data-cluster-m.europe-west4-a.c.braided-grammar-436313-g5.internal./10.164.0.23:8032
2024-10-22 22:10:12,766 INFO client.AHSProxy: Connecting to Application History server at big-data-cluster-m.europe-west4-a.c.braided-grammar-436313-g5.internal./10.164.0.23:10200
2024-10-22 22:10:13,235 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at big-data-cluster-m.europe-west4-a.c.braided-grammar-436313-g5.internal./10.164.0.23:8032
2024-10-22 22:10:13,235 INFO client.AHSProxy: Connecting to Application History server at big-data-cluster-m.europe-west4-a.c.braided-grammar-436313-g5.internal./10.164.0.23:10200
2024-10-22 22:10:13,332 ERROR streaming.StreamJob: Error Launching job : Output directory hdfs://big-data-cluster-m/user/dawiden1/output already exists
Streaming Command Failed!
dawiden1@big-data-cluster-m:~$ hdfs dfs -ls
Found 2 items
drwxr-xr-x   - dawiden1 hadoop          0 2024-10-22 21:20 input
drwxr-xr-x   - dawiden1 hadoop          0 2024-10-22 21:33 output

dawiden1@big-data-cluster-m:~$ hdfs dfs -rm output
rm: 'output': Is a directory

dawiden1@big-data-cluster-m:~$ hdfs dfs -rm -r ./output
Deleted output

dawiden1@big-data-cluster-m:~$ hadoop jar /usr/lib/hadoop/hadoop-streaming.jar     -input input     -output output     -mapper mapper.py     -reducer reducer.py     -combiner combiner.py     -file mapper.py     -file reducer.py     -file combiner.py
2024-10-22 22:11:30,773 WARN streaming.StreamJob: -file option is deprecated, please use generic option -files instead.
packageJobJar: [mapper.py, reducer.py, combiner.py] [/usr/lib/hadoop/hadoop-streaming-3.3.6.jar] /tmp/streamjob6383257172779215033.jar tmpDir=null
2024-10-22 22:11:32,061 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at big-data-cluster-m.europe-west4-a.c.braided-grammar-436313-g5.internal./10.164.0.23:8032
2024-10-22 22:11:32,236 INFO client.AHSProxy: Connecting to Application History server at big-data-cluster-m.europe-west4-a.c.braided-grammar-436313-g5.internal./10.164.0.23:10200
2024-10-22 22:11:32,713 INFO client.DefaultNoHARMFailoverProxyProvider: Connecting to ResourceManager at big-data-cluster-m.europe-west4-a.c.braided-grammar-436313-g5.internal./10.164.0.23:8032
2024-10-22 22:11:32,713 INFO client.AHSProxy: Connecting to Application History server at big-data-cluster-m.europe-west4-a.c.braided-grammar-436313-g5.internal./10.164.0.23:10200
2024-10-22 22:11:32,902 INFO mapreduce.JobResourceUploader: Disabling Erasure Coding for path: /tmp/hadoop-yarn/staging/dawiden1/.staging/job_1729630040733_0003
2024-10-22 22:11:33,367 INFO mapred.FileInputFormat: Total input files to process : 50
2024-10-22 22:11:33,426 INFO mapreduce.JobSubmitter: number of splits:50
2024-10-22 22:11:33,649 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1729630040733_0003
2024-10-22 22:11:33,649 INFO mapreduce.JobSubmitter: Executing with tokens: []
2024-10-22 22:11:33,816 INFO conf.Configuration: resource-types.xml not found
2024-10-22 22:11:33,817 INFO resource.ResourceUtils: Unable to find 'resource-types.xml'.
2024-10-22 22:11:33,880 INFO impl.YarnClientImpl: Submitted application application_1729630040733_0003
2024-10-22 22:11:33,931 INFO mapreduce.Job: The url to track the job: http://big-data-cluster-m.europe-west4-a.c.braided-grammar-436313-g5.internal.:8088/proxy/application_1729630040733_0003/
2024-10-22 22:11:33,933 INFO mapreduce.Job: Running job: job_1729630040733_0003
2024-10-22 22:11:46,041 INFO mapreduce.Job: Job job_1729630040733_0003 running in uber mode : false
2024-10-22 22:11:46,042 INFO mapreduce.Job:  map 0% reduce 0%
2024-10-22 22:11:54,121 INFO mapreduce.Job:  map 2% reduce 0%
2024-10-22 22:12:00,161 INFO mapreduce.Job:  map 8% reduce 0%
2024-10-22 22:12:08,213 INFO mapreduce.Job:  map 10% reduce 0%
2024-10-22 22:12:12,234 INFO mapreduce.Job:  map 14% reduce 0%
2024-10-22 22:12:15,249 INFO mapreduce.Job:  map 16% reduce 0%
2024-10-22 22:12:21,281 INFO mapreduce.Job:  map 18% reduce 0%
2024-10-22 22:12:24,297 INFO mapreduce.Job:  map 22% reduce 0%
2024-10-22 22:12:28,318 INFO mapreduce.Job:  map 24% reduce 0%
2024-10-22 22:12:34,349 INFO mapreduce.Job:  map 26% reduce 0%
2024-10-22 22:12:36,362 INFO mapreduce.Job:  map 30% reduce 0%
2024-10-22 22:12:41,387 INFO mapreduce.Job:  map 32% reduce 0%
2024-10-22 22:12:47,419 INFO mapreduce.Job:  map 34% reduce 0%
2024-10-22 22:12:48,423 INFO mapreduce.Job:  map 38% reduce 0%
2024-10-22 22:12:53,448 INFO mapreduce.Job:  map 40% reduce 0%
2024-10-22 22:13:00,482 INFO mapreduce.Job:  map 46% reduce 0%
2024-10-22 22:13:06,517 INFO mapreduce.Job:  map 48% reduce 0%
2024-10-22 22:13:12,545 INFO mapreduce.Job:  map 52% reduce 0%
2024-10-22 22:13:13,549 INFO mapreduce.Job:  map 54% reduce 0%
2024-10-22 22:13:19,574 INFO mapreduce.Job:  map 56% reduce 0%
2024-10-22 22:13:23,599 INFO mapreduce.Job:  map 58% reduce 0%
2024-10-22 22:13:24,603 INFO mapreduce.Job:  map 60% reduce 0%
2024-10-22 22:13:25,607 INFO mapreduce.Job:  map 62% reduce 0%
2024-10-22 22:13:31,635 INFO mapreduce.Job:  map 64% reduce 0%
2024-10-22 22:13:36,659 INFO mapreduce.Job:  map 68% reduce 0%
2024-10-22 22:13:37,663 INFO mapreduce.Job:  map 70% reduce 0%
2024-10-22 22:13:43,685 INFO mapreduce.Job:  map 72% reduce 0%
2024-10-22 22:13:48,718 INFO mapreduce.Job:  map 76% reduce 0%
2024-10-22 22:13:50,726 INFO mapreduce.Job:  map 78% reduce 0%
2024-10-22 22:13:56,755 INFO mapreduce.Job:  map 80% reduce 0%
2024-10-22 22:13:59,782 INFO mapreduce.Job:  map 82% reduce 0%
2024-10-22 22:14:00,785 INFO mapreduce.Job:  map 84% reduce 0%
2024-10-22 22:14:02,794 INFO mapreduce.Job:  map 86% reduce 0%
2024-10-22 22:14:08,817 INFO mapreduce.Job:  map 88% reduce 0%
2024-10-22 22:14:12,833 INFO mapreduce.Job:  map 92% reduce 0%
2024-10-22 22:14:14,840 INFO mapreduce.Job:  map 94% reduce 0%
2024-10-22 22:14:21,869 INFO mapreduce.Job:  map 96% reduce 0%
2024-10-22 22:14:24,881 INFO mapreduce.Job:  map 100% reduce 0%
2024-10-22 22:14:30,902 INFO mapreduce.Job:  map 100% reduce 33%
2024-10-22 22:14:36,929 INFO mapreduce.Job:  map 100% reduce 100%
2024-10-22 22:14:37,938 INFO mapreduce.Job: Job job_1729630040733_0003 completed successfully
2024-10-22 22:14:38,025 INFO mapreduce.Job: Counters: 55
        File System Counters
                FILE: Number of bytes read=49084
                FILE: Number of bytes written=15557450
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=34560017
                HDFS: Number of bytes written=889
                HDFS: Number of read operations=165
                HDFS: Number of large read operations=0
                HDFS: Number of write operations=9
                HDFS: Number of bytes read erasure-coded=0
        Job Counters 
                Killed reduce tasks=1
                Launched map tasks=50
                Launched reduce tasks=3
                Data-local map tasks=50
                Total time spent by all maps in occupied slots (ms)=1400530814
                Total time spent by all reduces in occupied slots (ms)=94554558
                Total time spent by all map tasks (ms)=427382
                Total time spent by all reduce tasks (ms)=28854
                Total vcore-milliseconds taken by all map tasks=427382
                Total vcore-milliseconds taken by all reduce tasks=28854
                Total megabyte-milliseconds taken by all map tasks=1400530814
                Total megabyte-milliseconds taken by all reduce tasks=94554558
        Map-Reduce Framework
                Map input records=56880
                Map output records=56841
                Map output bytes=643639
                Map output materialized bytes=49966
                Input split bytes=5400
                Combine input records=56841
                Combine output records=2677
                Reduce input groups=56
                Reduce shuffle bytes=49966
                Reduce input records=2677
                Reduce output records=56
                Spilled Records=5354
                Shuffled Maps =150
                Failed Shuffles=0
                Merged Map outputs=150
                GC time elapsed (ms)=4218
                CPU time spent (ms)=59500
                Physical memory (bytes) snapshot=31692562432
                Virtual memory (bytes) snapshot=250142302208
                Total committed heap usage (bytes)=27690795008
                Peak Map Physical memory (bytes)=692289536
                Peak Map Virtual memory (bytes)=4737302528
                Peak Reduce Physical memory (bytes)=407093248
                Peak Reduce Virtual memory (bytes)=4724195328
        Shuffle Errors
                BAD_ID=0
                CONNECTION=0
                IO_ERROR=0
                WRONG_LENGTH=0
                WRONG_MAP=0
                WRONG_REDUCE=0
        File Input Format Counters 
                Bytes Read=34554617
        File Output Format Counters 
                Bytes Written=889
2024-10-22 22:14:38,026 INFO streaming.StreamJob: Output directory: output

dawiden1@big-data-cluster-m:~$ hadoop dfs -ls ./output
WARNING: Use of this script to execute dfs is deprecated.
WARNING: Attempting to execute replacement "hdfs dfs" instead.

Found 4 items
-rw-r--r--   2 dawiden1 hadoop          0 2024-10-22 22:14 output/_SUCCESS
-rw-r--r--   2 dawiden1 hadoop        383 2024-10-22 22:14 output/part-00000
-rw-r--r--   2 dawiden1 hadoop        208 2024-10-22 22:14 output/part-00001
-rw-r--r--   2 dawiden1 hadoop        298 2024-10-22 22:14 output/part-00002

dawiden1@big-data-cluster-m hadoop fs -copyToLocal ./output
dawiden1@big-data-cluster-m:~$ ls -l
total 52
-rwxr-xr-x 1 dawiden1 dawiden1   877 Oct 22 21:56 combiner.py
drwxr-xr-x 2 dawiden1 dawiden1  4096 Oct 22 21:12 datasource1
-rw-r--r-- 1 dawiden1 dawiden1 30957 Oct 22 22:08 input.csv
-rwxr-xr-x 1 dawiden1 dawiden1   691 Oct 22 22:01 mapper.py
drwxr-xr-x 2 dawiden1 dawiden1  4096 Oct 22 22:18 output
-rwxr-xr-x 1 dawiden1 dawiden1  2018 Oct 22 21:55 reducer.py

dawiden1@big-data-cluster-m:~$ gsutil mv output gs://bd-wsb-24-09-dm/projekt1/
Copying file://output/part-00000 [Content-Type=application/octet-stream]...
Removing file://output/part-00000...                                            
Copying file://output/part-00001 [Content-Type=application/octet-stream]...
Removing file://output/part-00001...                                            
Copying file://output/_SUCCESS [Content-Type=application/octet-stream]...
Removing file://output/_SUCCESS...                                              
Copying file://output/part-00002 [Content-Type=application/octet-stream]...
Removing file://output/part-00002...                                            

Operation completed over 4 objects/889.0 B.                                      
dawiden1@big-data-cluster-m:~$ ls -l
total 52
-rwxr-xr-x 1 dawiden1 dawiden1   877 Oct 22 21:56 combiner.py
drwxr-xr-x 2 dawiden1 dawiden1  4096 Oct 22 21:12 datasource1
-rw-r--r-- 1 dawiden1 dawiden1 30957 Oct 22 22:08 input.csv
-rwxr-xr-x 1 dawiden1 dawiden1   691 Oct 22 22:01 mapper.py
drwxr-xr-x 2 dawiden1 dawiden1  4096 Oct 22 22:19 output
-rwxr-xr-x 1 dawiden1 dawiden1  2018 Oct 22 21:55 reducer.py

dawiden1@big-data-cluster-m:~$ gsutil mv gs://bd-wsb-24-09-dm/projekt1/output .
Copying gs://bd-wsb-24-09-dm/projekt1/output/_SUCCESS...
Removing gs://bd-wsb-24-09-dm/projekt1/output/_SUCCESS...                       
Copying gs://bd-wsb-24-09-dm/projekt1/output/part-00000...
Removing gs://bd-wsb-24-09-dm/projekt1/output/part-00000...                     
Copying gs://bd-wsb-24-09-dm/projekt1/output/part-00001...
Removing gs://bd-wsb-24-09-dm/projekt1/output/part-00001...                     
Copying gs://bd-wsb-24-09-dm/projekt1/output/part-00002...
Removing gs://bd-wsb-24-09-dm/projekt1/output/part-00002...
Operation completed over 4 objects/889.0 B.

dawiden1@big-data-cluster-m:~$ ls -l
total 52
-rwxr-xr-x 1 dawiden1 dawiden1   877 Oct 22 21:56 combiner.py
drwxr-xr-x 2 dawiden1 dawiden1  4096 Oct 22 21:12 datasource1
-rw-r--r-- 1 dawiden1 dawiden1 30957 Oct 22 22:08 input.csv
-rwxr-xr-x 1 dawiden1 dawiden1   691 Oct 22 22:01 mapper.py
drwxr-xr-x 2 dawiden1 dawiden1  4096 Oct 22 22:22 output
-rwxr-xr-x 1 dawiden1 dawiden1  2018 Oct 22 21:55 reducer.py

dawiden1@big-data-cluster-m:~$ gsutil cp -r output gs://bd-wsb-24-09-dm/projekt1/
Copying file://output/part-00000 [Content-Type=application/octet-stream]...
Copying file://output/part-00001 [Content-Type=application/octet-stream]...     
Copying file://output/_SUCCESS [Content-Type=application/octet-stream]...       
Copying file://output/part-00002 [Content-Type=application/octet-stream]...     
/ [4 files][  889.0 B/  889.0 B]                                                
Operation completed over 4 objects/889.0 B.

dawiden1@big-data-cluster-m:~$ cat output/part-00000
14      8400,23,1394
17      2413,25,1687
20      5125,24,1088
2012    3170,26,1030
2018    528,25,465
308     5086,25,1700
317     586,24,83
32      2288,25,1903
332     1045,25,95
335     2367,25,1233
338     518,24,356
341     6836,25,1337
347     2735,26,241
350     6653,26,1610
353     4850,25,2468
41      1517,24,1275
50      3915,24,1061
53      21643,24,1143
56      1569,24,1297
62      500,25,42
65      904,23,1183
68      8895,25,1766
80      4041,24,865
83      2342,25,1433
dawiden1@big-data-cluster-m:~$ cat output/part-00001
189     4244,24,828
2013    572,25,47
2019    500,25,428
2076    1065,24,1480
318     551,25,51
330     2200,25,1009
336     1473,25,1695
351     1949,25,819
39      3018,25,1806
54      3610,25,2141
60      2255,23,1714
63      2850,25,269
66      2103,24,1718
dawiden1@big-data-cluster-m:~$ cat output/part-00002
1       3450,23,1023
10      3813,23,1443
13      34433,23,1119
16      14871,24,1084
19      19817,24,822
2017    510,26,463
2020    513,26,423
2149    583,25,433
31      21530,25,1091
319     705,26,164
322     506,25,76
337     520,26,438
349     2060,26,1286
4       5346,24,1323
61      2270,24,2431
64      630,26,35
67      10464,24,836
7       13955,27,452
76      18120,26,363
dawiden1@big-data-cluster-m:~$ 