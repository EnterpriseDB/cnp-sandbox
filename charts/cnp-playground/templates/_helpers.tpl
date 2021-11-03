{{/*
Expand the name of the chart.
*/}}
{{- define "cnp-playground.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cnp-playground.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cnp-playground.labels" -}}
helm.sh/chart: {{ include "cnp-playground.chart" . }}
{{ include "cnp-playground.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cnp-playground.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cnp-playground.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
