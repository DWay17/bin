#!/bin/sh
basepath="/cygdrive/c/develop"
workspaces="tos53di talend_workspace_di_demo"
workspaces="talend_workspace_di_demo"
#workspaces=$(find /c/develop/ -maxdepth 1 -regextype posix-extended -iregex '.*(tos|talend).*' -type d | sed s'#/c/develop/##g')
cdirs="
.JETEmitters/runtime
.JETEmitters/runtime/org/talend/designer/codegen/translators/common
.JETEmitters/runtime/org/talend/designer/codegen/translators/custom_code
.JETEmitters/runtime/org/talend/designer/codegen/translators/data_quality
.JETEmitters/runtime/org/talend/designer/codegen/translators/databases/db_jdbc
.JETEmitters/runtime/org/talend/designer/codegen/translators/file/input
.JETEmitters/runtime/org/talend/designer/codegen/translators/processing
.JETEmitters/runtime/org/talend/designer/codegen/translators/technical
.JETEmitters/src/org/talend/designer/codegen/translators/common
.JETEmitters/src/org/talend/designer/codegen/translators/databases/db_jdbc
.Java/bin/classes
.Java/bin/src
.Java/classes/routines/system/api
.Java/classes/xmlMappings
.Java/lib
.Java/src/routines/system/api
.Java/src/xmlMappings
.metadata/.plugins/org.eclipse.core.resources/.history/
"
for workspace in $workspaces ; do
	for dir in $cdirs ; do
		ddir="$basepath/$workspace/$dir"
		id | grep -i admin > /dev/null
		if [ $? -eq 0 ] ; then
			echo "admin don't create dir" $ddir
		else
			mkdir -vp $ddir
		fi
		touch $ddir
		chmod -c ug+rwx $ddir
		find $ddir -type d -exec chmod -c ug+rwx {} \;
		find $ddir -type f -exec chmod -c ug+rw {} \;
	done
done

