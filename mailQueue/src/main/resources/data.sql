    INSERT INTO user(user_id, active, email, nick, password)
    VALUES ('1', '1', 'admin@gmail.com', 'GM admin','$2a$10$U0sDc50Se4to7CqRV8pfg.98WXDdfrnfNjDvkcJBOPV505pfTPJ0e');
-- password: Admin1
    INSERT INTO user(user_id, active, email, nick, password)
    VALUES ('2', '1', 'marcin@wp.pl', 'Marcin','$2a$10$Mu05TaJXmUzwAQ2eXJpOJ.XpaheP2EdmeHIphTQN2GDJLJ4MTkKaa');
-- password: Marcin123

    INSERT INTO role(role_id, role)
    VALUES ('1', 'ROLE_ADMIN');

    INSERT INTO role(role_id, role)
    VALUES ('2', 'ROLE_USER');

    INSERT INTO user_role(user_id, role_id)
    VALUES ('1', '1');

    INSERT INTO user_role(user_id, role_id)
    VALUES ('2', '1');

