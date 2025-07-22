########## CREATING A DATABASE #########
CREATE DATABASE f_people;

########## CREATING TABLES AND POPULATING THEM ###########

# 1. FamousPeople Table
CREATE TABLE Famous_People (
    person_id INT PRIMARY KEY,
    name VARCHAR(100),
    birth_year INT,
    country VARCHAR(50),
    gender VARCHAR(10)
);

INSERT INTO Famous_People (person_id, name, birth_year, country, gender) VALUES
(1, 'Beyoncé Knowles', 1981, 'USA', 'Female'),
(2, 'Will Smith', 1968, 'USA', 'Male'),
(3, 'Lady Gaga', 1986, 'USA', 'Female'),
(4, 'Donald Glover', 1983, 'USA', 'Male'),
(5, 'Adele Adkins', 1988, 'UK', 'Female'),
(6, 'Idris Elba', 1972, 'UK', 'Male'),
(7, 'Selena Gomez', 1992, 'USA', 'Female'),
(8, 'Jamie Foxx', 1967, 'USA', 'Male'),
(9, 'Harry Styles', 1994, 'UK', 'Male'),
(10, 'Jennifer Lopez', 1969, 'USA', 'Female'),
(11, 'Drake Graham', 1986, 'Canada', 'Male'),
(12, 'Zendaya Coleman', 1996, 'USA', 'Female'),
(13, 'Ed Sheeran', 1991, 'UK', 'Male'),
(14, 'Rihanna Fenty', 1988, 'Barbados', 'Female'),
(15, 'Bruno Mars', 1985, 'USA', 'Male'),
(16, 'Emma Watson', 1990, 'UK', 'Female'),
(17, 'Chris Brown', 1989, 'USA', 'Male'),
(18, 'Ariana Grande', 1993, 'USA', 'Female'),
(19, 'Michael B. Jordan', 1987, 'USA', 'Male'),
(20, 'Dua Lipa', 1995, 'UK', 'Female'),
(21, 'Sarkodie', 1988, 'Ghana', 'Male'),
(22, 'Yvonne Nelson', 1985, 'Ghana', 'Female'),
(23, 'Stonebwoy', 1988, 'Ghana', 'Male'),
(24, 'Lydia Forson', 1984, 'Ghana', 'Female'),
(25, 'Shatta Wale', 1984, 'Ghana', 'Male');

SELECT * FROM famous_people;

# 2. Roles Table
CREATE TABLE Role (
    role_id INT PRIMARY KEY,
    person_id INT,
    role_type ENUM('Actor', 'Artist', 'Both'),
    debut_year INT,
    still_active TEXT,
    FOREIGN KEY (person_id) REFERENCES Famous_People(person_id)
);

INSERT INTO Role (role_id, person_id, role_type, debut_year, still_active) VALUES
(1, 1, 'Artist', 1997, 'True'),
(2, 2, 'Actor', 1990, 'True'),
(3, 3, 'Artist', 2008, 'True'),
(4, 4, 'Both', 2006, 'True'),
(5, 5, 'Artist', 2006, 'True'),
(6, 6, 'Actor', 1995, 'True'),
(7, 7, 'Both', 2007, 'True'),
(8, 8, 'Both', 1991, 'True'),
(9, 9, 'Both', 2010, 'True'),
(10, 10, 'Both', 1999, 'True'),
(11, 11, 'Both', 2006, 'True'),
(12, 12, 'Both', 2009, 'True'),
(13, 13, 'Artist', 2005, 'True'),
(14, 14, 'Artist', 2005, 'True'),
(15, 15, 'Artist', 2004, 'True'),
(16, 16, 'Actor', 2001, 'True'),
(17, 17, 'Artist', 2005, 'True'),
(18, 18, 'Both', 2008, 'True'),
(19, 19, 'Actor', 2006, 'True'),
(20, 20, 'Artist', 2015, 'True'),
(21, 21, 'Artist', 2005, 'True'),
(22, 22, 'Actor', 2007, 'True'),
(23, 23, 'Artist', 2012, 'True'),
(24, 24, 'Actor', 2006, 'True'),
(25, 25, 'Artist', 2004, 'True');

SELECT * FROM role;

# 3. Famous Works Table
CREATE TABLE Famous_Work (
    work_id INT PRIMARY KEY,
    person_id INT,
    title VARCHAR(100),
    type ENUM('Movie', 'Album'),
    release_year INT,
    FOREIGN KEY (person_id) REFERENCES Famous_People(person_id)
);

INSERT INTO Famous_Work (work_id, person_id, title, type, release_year) VALUES
(1, 1, 'Lemonade', 'Album', 2016),
(2, 2, 'Bad Boys for Life', 'Movie', 2020),
(3, 3, 'Chromatica', 'Album', 2020),
(4, 4, 'Atlanta', 'Movie', 2016),
(5, 5, '30', 'Album', 2021),
(6, 6, 'Luther', 'Movie', 2010),
(7, 7, 'Rare', 'Album', 2020),
(8, 8, 'Ray', 'Movie', 2004),
(9, 9, 'Fine Line', 'Album', 2019),
(10, 10, 'On the 6', 'Album', 1999),
(11, 11, 'Certified Lover Boy', 'Album', 2021),
(12, 12, 'Euphoria', 'Movie', 2019),
(13, 13, 'Divide', 'Album', 2017),
(14, 14, 'ANTI', 'Album', 2016),
(15, 15, '24K Magic', 'Album', 2016),
(16, 16, 'Beauty and the Beast', 'Movie', 2017),
(17, 17, 'F.A.M.E.', 'Album', 2011),
(18, 18, 'Positions', 'Album', 2020),
(19, 19, 'Creed', 'Movie', 2015),
(20, 20, 'Future Nostalgia', 'Album', 2020),
(21, 21, 'Highest', 'Album', 2017),
(22, 22, 'Single and Married', 'Movie', 2012),
(23, 23, 'Epistles of Mama', 'Album', 2017),
(24, 24, 'A Letter From Adam', 'Movie', 2014),
(25, 25, 'After the Storm', 'Album', 2016);
 
 SELECT fp.name, fw.title
 FROM Famous_People fp
 JOIN Famous_work fw ON fp.person_id = fw.person_id;

SELECT * FROM famous_work;

# 4. Genres Table
/** Popularity_score -- a simple numeric ranking (1–100),
Mood -- e.g., Energetic, Emotional, Dark**/
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    work_id INT,
    genre_name VARCHAR(50),
    popularity_score INT,
    mood VARCHAR(30),
    FOREIGN KEY (work_id) REFERENCES Famous_work(work_id)
);

INSERT INTO Genre (genre_id, work_id, genre_name, popularity_score, mood) VALUES
(1, 1, 'Pop', 95, 'Energetic'),
(2, 2, 'Drama', 88, 'Inspiring'),
(3, 3, 'Dance Pop', 90, 'Upbeat'),
(4, 4, 'Comedy', 85, 'Playful'),
(5, 5, 'Soul', 89, 'Emotional'),
(6, 6, 'Thriller', 82, 'Intense'),
(7, 7, 'Pop', 91, 'Romantic'),
(8, 8, 'Biopic', 80, 'Emotional'),
(9, 9, 'Pop Rock', 87, 'Chill'),
(10, 10, 'Latin Pop', 88, 'Sensual'),
(11, 11, 'Hip Hop', 94, 'Confident'),
(12, 12, 'Teen Drama', 85, 'Nostalgic'),
(13, 13, 'Folk Pop', 89, 'Mellow'),
(14, 14, 'R&B', 92, 'Seductive'),
(15, 15, 'Funk', 86, 'Groovy'),
(16, 16, 'Fantasy', 83, 'Adventurous'),
(17, 17, 'R&B', 90, 'Heartfelt'),
(18, 18, 'Pop', 93, 'Happy'),
(19, 19, 'Action', 87, 'Heroic'),
(20, 20, 'Dance Pop', 91, 'Exciting'),
(21, 21, 'Hip Hop', 88, 'Bold'),
(22, 22, 'Romantic Drama', 80, 'Emotional'),
(23, 23, 'Dancehall', 89, 'Energetic'),
(24, 24, 'Drama', 82, 'Serious'),
(25, 25, 'Reggae Dancehall', 90, 'Laid-back');

SELECT * FROM genre;

# 5. Awards Table
CREATE TABLE Award (
    award_id INT PRIMARY KEY,
    person_id INT,
    award_name VARCHAR(100),
    category VARCHAR(100),
    award_year INT,
    FOREIGN KEY (person_id) REFERENCES Famous_People(person_id)
);

INSERT INTO Award (award_id, person_id, award_name, category, award_year) VALUES
(1, 1, 'Grammy Award', 'Best Urban Contemporary Album', 2017),
(2, 2, 'Academy Award', 'Best Actor', 2022),
(3, 3, 'Grammy Award', 'Best Pop Vocal Album', 2021),
(4, 4, 'Emmy Award', 'Outstanding Lead Actor in Comedy Series', 2017),
(5, 5, 'Brit Award', 'British Album of the Year', 2022),
(6, 6, 'Golden Globe', 'Best Actor in a Miniseries', 2012),
(7, 7, 'American Music Award', 'Favorite Female Artist – Pop/Rock', 2020),
(8, 8, 'Academy Award', 'Best Actor', 2005),
(9, 9, 'Grammy Award', 'Best Pop Solo Performance', 2021),
(10, 10, 'Billboard Music Award', 'Icon Award', 2014),
(11, 11, 'Billboard Music Award', 'Top Artist', 2017),
(12, 12, 'Primetime Emmy', 'Outstanding Lead Actress', 2022),
(13, 13, 'Ivor Novello Award', 'Songwriter of the Year', 2015),
(14, 14, 'Grammy Award', 'Best Urban Contemporary Album', 2019),
(15, 15, 'Grammy Award', 'Record of the Year', 2016),
(16, 16, 'MTV Movie Award', 'Best On-Screen Duo', 2012),
(17, 17, 'BET Award', 'Best Male R&B/Pop Artist', 2015),
(18, 18, 'Grammy Award', 'Best Pop Vocal Album', 2021),
(19, 19, 'NAACP Image Award', 'Outstanding Actor', 2020),
(20, 20, 'Brit Award', 'British Female Solo Artist', 2021),
(21, 21, 'Ghana Music Award', 'Artiste of the Decade', 2019),
(22, 22, 'Ghana Movie Award', 'Best Actress in a Leading Role', 2013),
(23, 23, 'Ghana Music Award', 'Best Reggae/Dancehall Artiste', 2020),
(24, 24, 'Africa Movie Academy Award', 'Best Actress in a Supporting Role', 2015),
(25, 25, 'Ghana Music Award', 'Artiste of the Year', 2014);

SELECT * FROM award;

# 6. Revenue Table
CREATE TABLE Revenue (
    revenue_id INT PRIMARY KEY,
	work_id INT,
    title VARCHAR(100),
    country VARCHAR(50),
    region VARCHAR(50),
    revenue_million DECIMAL(10,2),
    year INT,
    FOREIGN KEY (work_id) REFERENCES Famous_Work(work_id)
);

INSERT INTO Revenue (revenue_id, work_id, title, country, region, revenue_million, year) VALUES
(1, 1, 'Lemonade', 'USA', 'North America', 350.00, 2016),
(2, 2, 'Bad Boys for Life', 'USA', 'North America', 426.50, 2020),
(3, 3, 'Chromatica', 'USA', 'North America', 200.00, 2020),
(4, 4, 'Atlanta (TV Series)', 'USA', 'North America', 150.00, 2018),
(5, 5, '30', 'UK', 'Europe', 290.75, 2021),
(6, 6, 'Luther', 'UK', 'Europe', 175.00, 2015),
(7, 7, 'Rare', 'USA', 'North America', 170.00, 2020),
(8, 8, 'Ray', 'USA', 'North America', 124.00, 2004),
(9, 9, 'Fine Line', 'UK', 'Europe', 230.00, 2019),
(10, 10, 'On the 6', 'USA', 'North America', 280.00, 1999),
(11, 11, 'Certified Lover Boy', 'Canada', 'North America', 320.50, 2021),
(12, 12, 'Euphoria', 'USA', 'North America', 190.00, 2019),
(13, 13, 'Divide', 'UK', 'Europe', 430.00, 2017),
(14, 14, 'ANTI', 'Barbados', 'Caribbean', 310.25, 2016),
(15, 15, '24K Magic', 'USA', 'North America', 360.00, 2016),
(16, 16, 'Beauty and the Beast', 'UK', 'Europe', 540.00, 2017),
(17, 17, 'F.A.M.E.', 'USA', 'North America', 220.00, 2011),
(18, 18, 'Positions', 'USA', 'North America', 250.00, 2020),
(19, 19, 'Creed', 'USA', 'North America', 173.60, 2015),
(20, 20, 'Future Nostalgia', 'UK', 'Europe', 300.00, 2020),
(21, 21, 'Highest', 'Ghana', 'West Africa', 120.00, 2017),
(22, 22, 'Single and Married', 'Ghana', 'West Africa', 75.50, 2012),
(23, 23, 'Epistles of Mama', 'Ghana', 'West Africa', 90.00, 2017),
(24, 24, 'A Letter From Adam', 'Ghana', 'West Africa', 65.00, 2014),
(25, 25, 'After the Storm', 'Ghana', 'West Africa', 85.00, 2016);

SELECT SUM(revenue_million) * 1000000 FROM revenue;

SELECT * FROM revenue;

# 7. SocialMediaStats Table (TikTok only)
CREATE TABLE Social_Media_Stats (
    stat_id INT PRIMARY KEY,
    person_id INT,
    platform VARCHAR(30),
    followers_million DECIMAL(6,2),
    total_likes_million DECIMAL(8,2),
    year_created INT,
    FOREIGN KEY (person_id) REFERENCES Famous_People(person_id)
);

INSERT INTO Social_Media_Stats 
(stat_id, person_id, platform, followers_million, total_likes_million, year_created) 
VALUES
(1, 1, 'TikTok', 6.60, 16.50, 2021),
(2, 2, 'TikTok', 80.00, 660.20, 2019),
(3, 3, 'TikTok', 16.40, 122.10, 2021),
(4, 4, 'TikTok', 1.20, 11.10, 2020),
(5, 5, 'TikTok', 1.20, 20.60, 2022),
(6, 6, 'TikTok', 2.50, 6.20, 2020),
(7, 7, 'TikTok', 59.80, 700.30, 2016),
(8, 8, 'TikTok', 46.90, 0.200, 2022),
(9, 9, 'TikTok', NULL, NULL, NULL),
(10, 10, 'TikTok', 17.50, 78.40, 2019),
(11, 11, 'TikTok', 1.20, 9.30, 2022),
(12, 12, 'TikTok', 12.70, 339.10, 2019),
(13, 13, 'TikTok', 17.80, 251.30, 2019),
(14, 14, 'TikTok', 16.00, 71.70, 2022),
(15, 15, 'TikTok', 15.20, 68.60, 2016),
(16, 16, 'TikTok', 0.03, 0.36, 2020),
(17, 17, 'TikTok', 11.00, 53.40, 2020),
(18, 18, 'TikTok', 38.70, 327.00, 2020),
(19, 19, 'TikTok', 0.22, 0.60, 2022),
(20, 20, 'TikTok', 11.1, 67.40, 2023),
(21, 21, 'TikTok', 0.77, 3.20, 2022),
(22, 22, 'TikTok', 0.35, 1.40, 2020),
(23, 23, 'TikTok', 1.70, 18.80, 2021),
(24, 24, 'TikTok', 0.47, 1.80, 2015),
(25, 25, 'TikTok', 2.80, 25.50, 2020);

SELECT * FROM social_media_stats;


############ QUESTIONS ############

# 1. Top 5 Most Connected People (by number of Tiktok likes):
SELECT fp.name AS 'Name', (sm.total_likes_million * 1000000) AS 'Number of likes(M)'
FROM Famous_People fp
JOIN Social_Media_Stats sm ON fp.person_id = sm.stat_id
GROUP BY sm.total_likes_million, fp.name
ORDER BY sm.total_likes_million DESC
LIMIT 5;

# 2. 5 Least Successful People (by revenue)
SELECT fp.name, SUM(r.revenue_million * 1000000) AS total_revenue
FROM Famous_People fp
JOIN Famous_Work w ON fp.person_id = w.person_id
JOIN Revenue r ON w.work_id = r.work_id
GROUP BY fp.name
ORDER BY total_revenue ASC
LIMIT 5;

# 3. People by Country & Regional Success
SELECT fp.country, r.region, SUM(r.revenue_million * 1000000) AS region_revenue
FROM Famous_People fp
JOIN Famous_Work w ON fp.person_id = w.person_id
JOIN Revenue r ON w.work_id = r.work_id
GROUP BY fp.country, r.region
ORDER BY SUM(r.revenue_million) DESC;

# 4. Award Distribution
SELECT award_name, COUNT(*) AS total_awards
FROM Award
GROUP BY award_name;

# 5. Revenue Trend (Movies & Songs)
SELECT w.type, r.year, SUM(r.revenue_million * 1000000) AS total_revenue
FROM Famous_Work w
JOIN Revenue r ON w.work_id = r.work_id
WHERE r.year = 2020
GROUP BY w.type, r.year
ORDER BY r.year;

# 6. Most Common Award Categories
SELECT category, COUNT(*) AS category_count
FROM Award
GROUP BY category
ORDER BY category_count DESC
LIMIT 5;

# 7. Number of Awards by Gender
SELECT fp.gender AS 'Gender', COUNT(a.award_name) AS 'Number of Awards'
FROM Famous_People fp
JOIN Award a ON fp.person_id = a.award_id
GROUP BY fp.gender;

# 8. "Which genre has generated the highest total revenue?"
SELECT g.genre_name, SUM(r.revenue_million * 1000000) AS total_revenue
FROM Genre g
JOIN Famous_Work w ON g.work_id = w.work_id
JOIN Revenue r ON w.work_id = r.work_id
GROUP BY g.genre_name
ORDER BY total_revenue DESC;


# 9. "Which regions generate the highest revenue for each genre over time?"
SELECT g.genre_name, r.region, r.year, SUM(r.revenue_million) AS total_revenue
FROM Revenue r
JOIN Famous_Work w ON r.work_id = w.work_id
JOIN Genre g ON w.work_id = g.work_id
GROUP BY g.genre_name, r.region, r.year
ORDER BY g.genre_name, r.year;

# 10. "How does an artist’s role (actor, singer, or both) influence their average revenue across different genres and regions?"
SELECT fp.name, r.role_type, g.genre_name, rv.region,
AVG(rv.revenue_million * 1000000 ) AS avg_revenue
FROM Famous_People fp
JOIN Role r ON fp.person_id = r.person_id
JOIN Famous_Work w ON fp.person_id = w.person_id
JOIN Genre g ON w.work_id = g.work_id
JOIN Revenue rv ON w.work_id = rv.work_id
LEFT JOIN Award a ON fp.person_id = a.person_id
GROUP BY fp.name, r.role_type, g.genre_name, rv.region
ORDER BY avg_revenue DESC; 

# 11. TOP 5 FAMOUS PEOPLE BY REVENUE 
SELECT fp.name, r.revenue_million * 1000000 AS 'Total Revenue'
FROM Famous_People fp
JOIN Revenue r ON fp.person_id = r.revenue_id
GROUP BY fp.name, r.revenue_million
ORDER BY r.revenue_million DESC
LIMIT 5;

# 12. MOST FOLLOWING ON SOCIAL MEDIA 
SELECT fp.name, sm.followers_million * 1000000 AS 'Tiktok Followers(M)'
FROM Famous_People fp
JOIN Social_media_stats sm ON fp.person_id = sm.stat_id
GROUP BY fp.name, sm.followers_million
ORDER BY sm.followers_million DESC
LIMIT 10;

# 13. Who's followers has grown fastest since joining?
SELECT fp.name, sm.followers_million AS 'Total Followers', sm.year_created AS 'Joined In'
FROM Famous_People fp 
JOIN Social_media_stats sm ON fp.person_id = sm.stat_id
WHERE sm.followers_million IS NOT NULL
GROUP BY fp.name,sm.followers_million, sm.year_created
ORDER BY sm.year_created ASC;

