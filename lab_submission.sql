-- CREATE EVN_average_customer_waiting_time_every_1_hour
CREATE EVENT `EVN_average_customer_waiting_time_every_1_hour`
ON SCHEDULE EVERY 1 HOUR
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    INSERT INTO `customer_service_kpi` (average_wait_time, created_at)
    SELECT 
        AVG(`customer_service_total_wait_time_minutes`) AS average_wait_time,
        CURRENT_TIMESTAMP AS created_at
    FROM 
        `customer_service_ticket`
    WHERE 
        `customer_service_ticket_raise_time` >= NOW() - INTERVAL 1 HOUR;
END //

DELIMITER ;
SHOW EVENTS;
SET GLOBAL event_scheduler = ON;
SHOW EVENTS;



