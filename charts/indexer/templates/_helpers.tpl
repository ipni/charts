{{- define "indexer.name" -}}
{{- printf "%sindexer" .Values.namePrefix -}}
{{- end -}}

{{- define "indexer.configMapName" -}}
{{- if .Values.configMapName -}}
{{- .Values.configMapName -}}
{{- else -}}
{{- printf "%sconfig-%s" .Values.namePrefix (.Values.config | toJson | sha256sum | trunc 10) -}}
{{- end -}}
{{- end -}}

{{/* Object metadata only. Never add these to the selector (immutable) or the
pod template (a change there restarts the indexer). */}}
{{- define "indexer.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
app.kubernetes.io/name: indexer
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
