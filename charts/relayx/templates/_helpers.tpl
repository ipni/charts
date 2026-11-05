{{- define "relayx.configMapName" -}}
{{- if .Values.pebbleOptions.configMapName -}}
{{- .Values.pebbleOptions.configMapName -}}
{{- else -}}
relayx-pebble-options-{{ .Values.pebbleOptions.content | sha256sum | trunc 10 }}
{{- end -}}
{{- end -}}

{{/* Object metadata only. Never add these to the selector (immutable) or the
pod template (a change there restarts relayx). */}}
{{- define "relayx.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
app.kubernetes.io/name: relayx
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
