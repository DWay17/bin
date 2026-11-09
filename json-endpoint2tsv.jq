#!/usr/bin/env -S jq -Mrf
# json jq
# ID	Status	Identifier	Name	Address	Managing Organization	Last Updated
# example:
# {
#   "resourceType": "Bundle",
#   "type": "searchset",
#   "timestamp": "2026-04-16T11:58:42.919+02:00",
#   "total": 15,
#   "link": [
#     {
#       "relation": "self",
#       "url": "https://dsf-fhir-ext.medicsh.de/fhir/Endpoint?_pretty=true&_page=1&_count=20&_format=json&_sort=address&status=active"
#     },
#     {
#       "relation": "first",
#       "url": "https://dsf-fhir-ext.medicsh.de/fhir/Endpoint?_pretty=true&_page=1&_count=20&_format=json&_sort=address&status=active"
#     },
#     {
#       "relation": "last",
#       "url": "https://dsf-fhir-ext.medicsh.de/fhir/Endpoint?_pretty=true&_page=1&_count=20&_format=json&_sort=address&status=active"
#     }
#   ],
#   "entry": [
#     {
#       "fullUrl": "https://dsf-fhir-ext.medicsh.de/fhir/Endpoint/6401e368-a9e2-4a14-a212-506859649a88",
#       "resource": {
#         "resourceType": "Endpoint",
#         "id": "6401e368-a9e2-4a14-a212-506859649a88",
#         "meta": {
#           "versionId": "22",
#           "lastUpdated": "2026-04-02T14:36:49.145+02:00",
#           "profile": [
#             "http://dsf.dev/fhir/StructureDefinition/endpoint"
#           ],
#           "tag": [
#             {
#               "system": "http://dsf.dev/fhir/CodeSystem/read-access-tag",
#               "code": "ALL"
#             }
#           ]
#         },
#         "identifier": [
#           {
#             "system": "http://dsf.dev/sid/endpoint-identifier",
#             "value": "ukb3337.ukbonn.de"
#           }
#         ],
#         "status": "active",
#         "connectionType": {
#           "system": "http://terminology.hl7.org/CodeSystem/endpoint-connection-type",
#           "code": "hl7-fhir-rest"
#         },
#         "name": "DSF Endpoint for ukb3337.ukbonn.de",
#         "managingOrganization": {
#           "reference": "Organization/5f0906ad-eb74-4588-8532-467ee18365f8",
#           "type": "Organization"
#         },
#         "payloadType": [
#           {
#             "coding": [
#               {
#                 "system": "http://hl7.org/fhir/resource-types",
#                 "code": "Task"
#               }
#             ]
#           }
#         ],
#         "payloadMimeType": [
#           "application/fhir+json",
#           "application/fhir+xml"
#         ],
#         "address": "https://ukb3337.ukbonn.de/fhir"
#       },
#       "search": {
#         "mode": "match"
#       }
#     }
#   ]
# }

["ID", "Status", "Identifier", "Name", "Address", "Managing Organization", "Last Updated"], 

(.entry[] as $item |
  ($item.resource.id // "") as $id
  | ($item.resource.status // "") as $status
  | ($item.resource.identifier[0].value // "") as $identifier
  | ($item.resource.name // "") as $name
  | ($item.resource.address // "") as $address
  | ($item.resource.managingOrganization.reference // "" | split("/")[1]) as $managingOrganization
  | ($item.resource.meta.lastUpdated // "") as $lastUpdated
  | [$id, $status, $identifier, $name, $address, $managingOrganization, $lastUpdated]
)

| @tsv
