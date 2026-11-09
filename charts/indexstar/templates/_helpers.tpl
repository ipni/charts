{{/* Object metadata only. Never add these to the selector (immutable) or the
pod template (a change there restarts indexstar). */}}
{{- define "indexstar.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
app.kubernetes.io/name: indexstar
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
