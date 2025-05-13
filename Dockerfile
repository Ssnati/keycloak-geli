# Usa la versión 26.2.0 de Keycloak
FROM quay.io/keycloak/keycloak:26.2.0

# Directorio de trabajo
WORKDIR /opt/keycloak

# Desactivar el strict hostname (útil en entornos cloud como Render)
ENV KC_HOSTNAME_STRICT=false

# Habilitar health checks y métricas si lo deseas
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Construir la distribución optimizada
RUN /opt/keycloak/bin/kc.sh build

# Exponer el puerto 8080
EXPOSE 8080

# Comando para iniciar Keycloak en modo optimizado
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--http-port=8080"]