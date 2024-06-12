-- �������ݿ�pet_manage
CREATE DATABASE pet_manage;
use pet_manage;
-- ��������Ա��
CREATE TABLE admin (
                       admin_id INT AUTO_INCREMENT PRIMARY KEY,
                       admin_name VARCHAR(50) NOT NULL UNIQUE,
                       admin_password VARCHAR(50) NOT NULL,
                       admin_phone_number VARCHAR(20)
);
-- �����û���
CREATE TABLE user (
                      user_id INT AUTO_INCREMENT PRIMARY KEY,
                      user_name VARCHAR(50) NOT NULL UNIQUE,
                      user_password VARCHAR(50) NOT NULL,
                      user_phone_number VARCHAR(20)
);
-- ���������
CREATE TABLE pet (
                     pet_id INT AUTO_INCREMENT PRIMARY KEY,
                     pet_name VARCHAR(50) NOT NULL,
                     pet_breed VARCHAR(255),
                     pet_age INT,
                     pet_gender ENUM('��', 'Ů'),
                     health_status VARCHAR(255),
                     adoption_status ENUM('δ����', '������'),
                     boarding_status ENUM('δ����', '�Ѽ���'),
                     owner_id INT,
                     FOREIGN KEY (owner_id) REFERENCES user(user_id)
);

-- �������﷿���
CREATE TABLE pet_room (
                          room_id INT AUTO_INCREMENT PRIMARY KEY,
                          room_type VARCHAR(255),
                          capacity INT,
                          current_occupancy INT,
                          status ENUM('����', 'ռ��')
);

-- ����������Ʒ��
CREATE TABLE pet_product (
                             product_id INT AUTO_INCREMENT PRIMARY KEY,
                             product_name VARCHAR(255) NOT NULL,
                             description TEXT,
                             price DECIMAL(10, 2) NOT NULL,
                             stock_quantity INT
);

-- ����������
CREATE TABLE orders (
                        orders_id INT AUTO_INCREMENT PRIMARY KEY,
                        user_id INT,
                        product_id INT,
                        quantity INT NOT NULL,
                        total_price DECIMAL(10, 2) NOT NULL,
                        order_status ENUM('��֧��', '��֧��', '�ѷ���', '�����'),
                        create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY (user_id) REFERENCES user(user_id),
                        FOREIGN KEY (product_id) REFERENCES pet_product(product_id)
);
-- ʹ��pet_manage���ݿ�
USE pet_manage;
-- �����Ա���������
INSERT INTO admin (admin.admin_name, admin_password, admin_phone_number) VALUES
                                                          ('admin1', 'password1', '12345678901'),
                                                          ('admin2', 'password2', '23456789012');
-- ���û����������
INSERT INTO user (user_name, user.user_password, user_phone_number) VALUES
                                                         ('user1', 'password1', '12345678901'),
                                                         ('user2', 'password2', '23456789012');
-- �������������
INSERT INTO pet (pet_name, pet_breed, pet.pet_age, pet_gender, health_status, adoption_status, boarding_status, owner_id) VALUES
                                                                                                          ('����', '�л���԰Ȯ', 3, '��', '����', 'δ����', 'δ����', 1),
                                                                                                          ('����', '�л���԰è', 2, 'Ů', '����', '������', 'δ����', 2);
-- ����﷿����������
INSERT INTO pet_room (room_type, capacity, current_occupancy, status) VALUES
                                                                          ('����Ȯ��', 5, 2, 'ռ��'),
                                                                          ('С��Ȯ��', 10, 0, '����');
-- �������Ʒ���������
INSERT INTO pet_product (product_name, description, price, stock_quantity) VALUES
                                                                               ('����ʳƷ', '��Ʒ��Ȯ��', 50.00, 100),
                                                                               ('�������', '��ҧĥ����', 20.00, 50);
-- �򶩵����������
INSERT INTO orders (user_id, product_id, quantity, total_price, order_status) VALUES
                                                                                  (1, 1, 2, 100.00, '��֧��'),
                                                                                  (2, 2, 1, 20.00, '��֧��');