# TA-barracuda-NGX

Author: Guilhem Marchand

This Technology Addon provides index time parsing and search time extractions (CIM mapping) for the barracuda
 NGX firewalls.

See:
https://community.barracudanetworks.com/forum/index.php?/topic/27286-syslog-message-format/

Barracuda data will ingested as syslog data, the strongly recommended approach is using a syslog receiver
(rsyslog, syslog-ng), and having Splunk with UF deployment monitoring the log files.
Otherwise, Splunk can act as the syslog receiver, but this approach has various limitations compared to the much
 more robust receiver deployment.

Barracuda firewalls will essentially provide 2 formats for the syslog data:

- An header less mode where "|" is used as the delimiter, use the sourcetype "barracuda_ngx_raw"
when designing your inputs.
- A Key / Value mode, very convenient for Splunk and easier to read for humans, use the sourcetype "barracuda_ngx_kv"
 when designing your inputs.

## Deploy this TA to:

- Indexers (standalone or clustered)
- Search Heads
- Intermediate Heavy Forwarders, if any
- Heavy Forwarder if used to monitor the syslog log files generated by the syslog receiver
- Heavy Forwarder if used to act as a Splunk syslog receiver (not recommended)

## Create your inputs:

### If using Splunk as a Syslog receiver (not recommended):

**Barracuda raw data mode**

Example of inputs.conf:

```
[tcp://5140]
connection_host = dns
sourcetype = barracuda_ngx_raw
```

**Barracuda kv data mode**

Example of inputs.conf:

```
[tcp://5140]
connection_host = dns
sourcetype = barracuda_ngx_kv
```

## Create your inputs:

### If using a syslog receiver and Splunk UF (recommended) or HF to monitor the syslog files:

Notes: in the example above, the 4th segment of the path is the name of the firewall host (HOST syslog variable)

**Barracuda raw data mode**

Example of inputs.conf:

```
[monitor:///var/log/syslog-remote/*/*.log]
index = barracuda_firewall
sourcetype = barracuda_ngx_raw
host_segment = 4
```

**Barracuda raw data mode**

Example of inputs.conf:

```
[monitor:///var/log/syslog-remote/*/*.log]
index = barracuda_firewall
sourcetype = barracuda_ngx_raw
host_segment = 4
```