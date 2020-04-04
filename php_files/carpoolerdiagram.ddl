CREATE TABLE user_details (u_id numeric(10, 0) NOT NULL, u_name varchar(255) NOT NULL, u_email varchar(255) NOT NULL, u_college varchar(255), u_dob varchar(255), u_sex varchar(255) NOT NULL, u_pass varchar(255) NOT NULL, u_enroll varchar(255), u_fb varchar(255), PRIMARY KEY (u_id));
CREATE TABLE ride_info_offered (r_id int(10) NOT NULL AUTO_INCREMENT, dri_u_id numeric(10, 0) NOT NULL, r_date date NOT NULL, from_loc varchar(255), to_college varchar(255), from_time varchar(255), reach_time varchar(255), num_seats int(10), extras int(10), PRIMARY KEY (r_id));
CREATE TABLE ride_pick_points (r_id int(10) NOT NULL, pick_points int(10) NOT NULL AUTO_INCREMENT, pick_point_time varchar(255), pick_price int(10), PRIMARY KEY (pick_points));
CREATE TABLE ride_proposals (rider_id numeric(10, 0) NOT NULL, r_id int(10), __pp_id int(10));
ALTER TABLE ride_info_offered ADD CONSTRAINT `can offer rides` FOREIGN KEY (dri_u_id) REFERENCES user_details (u_id);
ALTER TABLE ride_pick_points ADD CONSTRAINT has FOREIGN KEY (r_id) REFERENCES ride_info_offered (r_id);
ALTER TABLE ride_proposals ADD CONSTRAINT `can propose` FOREIGN KEY (rider_id) REFERENCES user_details (u_id);
