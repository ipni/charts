{{/* The env map as a container's env list, sorted by name. A value is a string,
a number, a boolean, or a map such as valueFrom. Fails if a name in requiredEnv
has no value. */}}
{{- define "cross-announce.env" -}}
{{- $env := default dict .Values.env -}}
{{- range .Values.requiredEnv -}}
{{- if not (get $env .) -}}
{{- fail (printf "env.%s is required" .) -}}
{{- end -}}
{{- end -}}
{{- range $name, $value := $env }}
{{- if kindIs "map" $value }}
- name: {{ $name }}
  {{- toYaml $value | nindent 2 }}
{{- else if kindIs "string" $value }}
- name: {{ $name }}
  value: {{ $value | quote }}
{{- else if not (kindIs "invalid" $value) }}
- name: {{ $name }}
  value: {{ $value | toJson | quote }}
{{- end }}
{{- end }}
{{- end -}}
