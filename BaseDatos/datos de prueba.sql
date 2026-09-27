INSERT INTO "Riegos" (id_riego, id_parcela, duracion, modo, fecha_hora)
VALUES
(4, 1, 20, 'Automático', CURRENT_TIMESTAMP),
(5, 1, 25, 'Manual', CURRENT_TIMESTAMP),
(6, 2, 15, 'Automático', CURRENT_TIMESTAMP);

INSERT INTO "Alertas" (id_alerta, id_parcela, tipo_alerta, mensaje, fecha_hora)
VALUES
(3, 1, 'Humedad baja', 'Se recomienda activar el sistema de riego', CURRENT_TIMESTAMP),
(4, 2, 'Temperatura alta', 'La temperatura de la parcela es elevada', CURRENT_TIMESTAMP);