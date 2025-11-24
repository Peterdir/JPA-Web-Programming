USE quanlydanhmuc;
INSERT INTO users (username, password, roleId) VALUES
('user1', '123', 1),
('manager1', '123', 2),
('admin1', '123', 3);

INSERT INTO category (name, user_id) VALUES
('Game', 2),
('Music', 2),
('Books', 1),
('Movies', 3);