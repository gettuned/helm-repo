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

{{/*
Create common init container to wait till config server is healthy.
*/}}
{{- define "tuned.common.initContainer.waitForConfigServer" -}}
name: wait-for-config
image: ghcr.io/gettuned/docker/busybox:main
command: ["sh", "-c", "until wget --spider -S http://config-service/actuator/health; do echo waiting for config-service; sleep 2; done;"]
{{- end -}}

{{/*
Create common init container to wait till the database is created.
*/}}
{{- define "tuned.common.initContainer.waitForDatabase" -}}
name: wait-for-db
image: ghcr.io/gettuned/docker/busybox:main
command: ["sh", "-c", "until nc -vz -w 1 postgresql 5432; do echo waiting for the database; sleep 2; done;"]
{{- end -}}
