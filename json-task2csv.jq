#!/usr/bin/env -S jq -Mrf

def ext($item; $url):
  $item.extension[0].extension[]? | select(.url == $url);

def errors($item):
  [ ext($item; "errors").extension[]?.extension[]? ];

["Organization", "Status", "Download_Mbps", "Upload_Gbps", "Error", "Fix"],

(.output[] as $item |
  # Vorab extrahieren
  (ext($item; "organization-identifier").valueIdentifier.value // "") as $org
  | ($item.valueCoding.code // "") as $status
  | (ext($item; "download-speed-from-remote").valueQuantity.value // "") as $down
  | (ext($item; "upload-speed-to-remote").valueQuantity.value // "") as $up
  | (errors($item) | map(select(.url=="error").valueCoding.display) | join("; ")) as $err
  | (errors($item) | map(select(.url=="potential-fix").valueUrl) | join("; ")) as $fix
  | [$org, $status, $down, $up, $err, $fix]
)
| @tsv
