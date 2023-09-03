{{/* vim: set filetype=mustache: */}}

{{/*
Generate basic custom labels
*/}}
{{- define "crossplane.customLabels" }}
{{- if .Values.crossplane.customLabels }}
{{ toYaml .Values.crossplane.customLabels }}
{{- end }}
{{- end }}
