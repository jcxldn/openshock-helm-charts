
{{- define "openshock.namespacedName" -}}
{{- printf "%s-%s" .Release.Namespace (include "openshock.fullname" . )  }}
{{- end }}


{{- define "openshock.prefix.frontendMiddleware" -}}
{{- printf "%s-frontend-middleware" (include "openshock.namespacedName" . )  }}
{{- end }}


{{- define "openshock.strings.frontend-ingress-middleware" -}}
{{- printf "%s-osr-%s@kubernetescrd" (include "openshock.namespacedName" .ctx ) .str }}
{{- end }}

{{- define "openshock.annotations.standard.frontend-ingress" -}}
{{- $labels := dict -}}
{{- $val := printf "%s,%s,%s" (include "openshock.strings.frontend-ingress-middleware" (dict  "ctx" $ "str" "c") ) (include "openshock.strings.frontend-ingress-middleware" (dict  "ctx" $ "str" "s") ) (include "openshock.strings.frontend-ingress-middleware" (dict  "ctx" $ "str" "t") ) }}
{{- $_ := set $labels "traefik.ingress.kubernetes.io/router.middlewares" $val }}

{{- toYaml $labels -}}

{{- end -}}