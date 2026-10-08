#!/usr/bin/env -S jq -Mrf

def ts:
  strptime("%Y-%m-%dT%H:%M:%S%z")
  | mktime;

def normalizeDate:
  sub("\\.[0-9]+"; "")
  | gsub("([+-][0-9]{2}):([0-9]{2})$"; "Z");

[  "message-name",  "status",  "requester",  "recipient",  "authoredOn",  "lastUpdated", "durationS", "durationM"],
(
  .entry[]
  | .resource as $r
  | 
	(
	[
		$r.input[]?
		| select(any(.type.coding[]?; .code=="message-name"))
			| .valueString
			][0] // ""
		) as $messageName
		| ($r.status // "") as $status
		| ($r.requester.identifier.value // "") as $requester
		| ($r.restriction.recipient[0].identifier.value // "") as $recipient
		| ($r.authoredOn // "") as $authoredOn
		| ($r.meta.lastUpdated // "") as $lastUpdated
		| ($authoredOn | normalizeDate) as $startText
		| ($lastUpdated | normalizeDate) as $endText
		| ($startText | fromdateiso8601) as $start
		| ($endText | fromdateiso8601) as $end
		| (($end - $start) / 60 | floor) as $durationMinutes
		| (($end - $start)) as $durationSeconds
		|
  [$messageName, $status, $requester, $recipient,  $authoredOn, $lastUpdated
		  #  , $startText
		  #  , $start
		  # , $endText
		   , $durationSeconds
		   , $durationMinutes
		  ]
)
| @tsv
