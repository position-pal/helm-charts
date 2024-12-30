{{- define "cassandra.waitForDatabase" -}}
initContainers:
    - name: wait-for-cassandra
      image: bitnami/cassandra:latest
      command:
          - /bin/bash
          - -c
          - |
              until cqlsh {{ .Release.Name }}-cassandra 9042 -u "admin" -p "password" -e "DESC KEYSPACES;" >/dev/null 2>&1; do
              echo "Waiting for Cassandra to be ready..."
              sleep 5
              done
              echo "Cassandra is ready!"
{{- end -}}