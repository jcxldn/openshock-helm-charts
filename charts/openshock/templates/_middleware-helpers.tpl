
{{- define "openshock.namespacedName" -}}
{{- printf "%s-%s" .Release.Namespace openshock.fullname  }}
{{- end }}


{{- define "openshock.prefix.frontendMiddleware" -}}
{{- printf "%s-frontend-middleware" openshock.namespacedName  }}
{{- end }}

{{- define "openshock.annotations.standard.frontend-ingress" -}}
traefik.ingress.kubernetes.io/router.middlewares: {{ include "openshock.prefix.frontendMiddleware" $ }}-osr-c {{ include "openshock.prefix.frontendMiddleware" $ }}-osr-s {{ include "openshock.prefix.frontendMiddleware" $ }}-osr-t

{{- end -}}