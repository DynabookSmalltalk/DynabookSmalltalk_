Encodes canvas commands into string-arrays format.

---possible further compression for forms ---
600 * 359 * 4    861600

self encodeForRemoteCanvas size 76063
Time millisecondsToRun: [self encodeForRemoteCanvas]

| raw data |
data := self encodeForRemoteCanvas.
raw := RWBinaryOrTextStream on: (String new: 1000).
Time millisecondsToRun: [(GZipWriteStream on: raw) nextPutAll: data; close].
raw contents size
(GZipReadStream on: (ReadStream on: raw contents)) upToEnd size

| raw |
raw := RWBinaryOrTextStream on: (String new: bits size).
raw nextPutAll: bits

Time millisecondsToRun: [bits compressGZip]   50

bits compressGZip size 861620