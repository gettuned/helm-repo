{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tuned.common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create common resource limits for medium resource intensive pods.
*/}}
{{- define "tuned.common.resources.limits" -}}
resources:
  limits:
    cpu: {{ .Values.resources.limits.cpu | default "200m" }}
    memory: {{ .Values.resources.limits.memory | default "100Mi" }}
  requests:
    cpu: {{ .Values.resources.requests.cpu | default "50m" }}
    memory: {{ .Values.resources.requests.memory | default "50Mi" }}
{{- end -}}