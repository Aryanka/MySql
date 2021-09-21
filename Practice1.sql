select mov_title, mov_year from movies;
select mov_year from movie where mov_title='American Beauty';
select mov_title from movie where mov_year='1999';
select mov_title from movie where mov_year < '1998';
select reviewers.rev_name union (select movie.mov_title from movie);
select reviewers.rev_name from reviewer, rating where rating.rev_id = reviewer.rev_id and rating.rev_stars >= 7 and  reviewers.rev_name is not null;
select movie.mov_title from movie, rating where movie.mov_id = rating.mov_id and reviewers.num_of_ratings=0;
select mov_title from movie where mov_id not in(select mov_id from ratings);
select mov_title from movie where mov_id in (905, 907, 917);
select mov_title, mov_year, mov_id from movie where mov_title like 'Boogie Nights' order by mov_year;
select act_id from actor where act_fname='Woody' and act_lname= 'Allen';

select * from actor where act_id in( select act_id from movie_cast where mov_id in(select mov_id from movie where mov_title='Annie Hall'));
select dir_fname, dir_lname from director where dir_id in(select dir_id from movie_direction where mov_id in (select mov_id from movie_cast where role ='Eyes Wide Shut'));
select m.mov_title, m.mov_year, m.mov_dt_rel, d.dir_fname, d.dir_lname, a.act_fname, act_lname from movie as m, movie_direction as md, director as d, movie_cast as mc, reviewres as r where a.mov_id=mc.mov_id and d.dir_id=md.dir_id and reviewer.rev_name is null;
select mov_title from movie where mov_id = (select mov_id from movie_direction where dir_id =(select dir_id from directors where dir_fname='woody' and dir_lastname='allen'));
select rev_name from reviewer as r inner join rating as ra on r.rev_id=ra.rev_id where rev_stars is not null;
SELECT rev_name
FROM reviewer
INNER JOIN rating USING(rev_id)
WHERE rev_stars IS NULL;

#2. Write a query in SQL to list the first and last names of all the actors who were cast in the movie 'Annie Hall', and the roles they played in that production. 
select act_fname, act_lname,role from movie as m inner join movie_cast as mc on m.mov_id = mc.mov_id inner join actor as a on mc.act_id=a.act_id AND movie.mov_title='Annie Hall';
#3. Write a query in SQL to find the name of movie and director (first and last names) who directed a movie that casted a role for 'Eyes Wide Shut'.
SELECT 
    mov_title, dir_fname, dir_lname
FROM
    movie AS m
        INNER JOIN
    movie_cast AS mc ON mc.mov_id = m.mov_id
        INNER JOIN
    actor AS a ON a.act_id = mc.act_id
WHERE
    mc.role = 'Eyes Wide Shut';
    
#4. Write a query in SQL to find the name of movie and director (first and last names) who directed a movie that casted a role as Sean Maguire.
SELECT 
    mov_title, dir_fname, dir_lname
FROM
    director
        NATURAL JOIN
    movie_direction
        NATURAL JOIN
    movie
        NATURAL JOIN
    movie_cast
WHERE
    mov_title = 'Sean Maguire';

#5. Write a query in SQL to list all the actors who have not acted in any movie between 1990 and 2000. 
SELECT 
    act_id, act_fname, act_lname, mov_year
FROM
    actor AS a
        INNER JOIN
    movie_cast AS mc ON a.act_id = mc.act_id
        INNER JOIN
    movie AS m ON m.mov_id = mc.mov_id
WHERE
    mov_id NOT BETWEEN 1990 AND 2000;

#6. Write a query in SQL to list first and last name of all the directors with number of genres movies the directed with genres name, and arranged the result alphabetically with the first and last name of the director.
select dir_fname, dir_lname,count(gen_title) from director as d inner join movie_genres as mg on d.mov_id=mg.mov_id inner join genres as g on mg.gen_id=g.gen_id group by dir_fname, dir_lname order by dir_fname, dir_lname;
select dir_fname, dir_lname,count(gen_title) from director natural join movie_genres natural join genres group by dir_fname, dir_lname order by dir_fname, dir_lname;

#Write a query in SQL to list all the movies with year and genres.
select mov_title, mov_year, gen_id from movie natural join movie_genres natural join genres group by mov_year order by gen_id;

#Write a query in SQL to list all the movies with year, genres, and name of the director.
select mov_title, mov_year, genre_title, dir_fname, dir_lname from movie natural join movie_genres natural join movie_directon natural join director;

#9. Write a query in SQL to list all the movies with title, year, date of release, movie duration, and first and last name of the director which released before 1st january 1989, and sort the result set according to release date from highest date to lowest.
select mov_title, mov_year, mov_dt_rel, mov_time, dir_fname, dir_lname from movie natural join movie_direction natural join director where mov_year < '1 jan' order by mov_dt_rel;
SELECT 
    mov_title,
    mov_year,
    mov_dt_rel,
    mov_time,
    dir_fname,
    dir_lname
FROM
    movie AS m
        INNER JOIN
    movie_direction AS md ON md.mov_id = m.mov_id
        INNER JOIN
    director AS d ON d.dir_id = md.dir_id
WHERE
    mov_year < '1 jan'
ORDER BY mov_dt_rel;

#10 Write a query in SQL to compute a report which contain the genres of those movies with their average time and number of movies for each genres. 
SELECT 
    g.gen_title, COUNT(gen_title), AVG(mov_time)
FROM
    movie AS m
        INNER JOIN
    movie_genres AS mg ON m.mov_id = mg.mov_id
        INNER JOIN
    genres ON g.gen_id = mg.gen_id
ORDER BY gen_id;

#11. Write a query in SQL to find those lowest duration movies along with the year, director's name, actor's name and his/her role in that production. 
select mov_time, mov_year, dir_fname, dir_lname, act_fname, act_lname, role  from movie natural join director natural join actor where mov_time = (select min(mov_time) from movie);

#12. Write a query in SQL to find all the years which produced a movie that received a rating of 3 or 4, and sort the result in increasing order
select mov_year from movie, rating WHERE movie.mov_id = rating.mov_id and rev_stars in (3,4) order by mov_year;

#13. Write a query in SQL to return the reviewer name, movie title, and stars in an order that reviewer name will come first, then by movie title, and lastly by number of stars.  
select rev_name, mov_title, rev_stars from movie as m inner join ratings as ra on m.mov_id=r.mov_id inner join reviewer as r on r.rev_id=ra.rev_id where rev_name is not null order by rev_name, mov_title, rev_stars;

#14. Write a query in SQL to find movie title and number of stars for each movie that has at least one rating and find the highest number of stars that movie received and sort the result by movie title. 
select mov_title, count(rev_stars) from movie inner join ratings group by movie having max(rev_stars)>0 order by movie;

#15. Write a query in SQL to find the director's first and last name together with the title of the movie(s) they directed and received the rating.
select dir_fname, dir_lname, mov_title from director as d inner join movie_direction as md on d.dir_id=md.dir_id inner join movie as m on md.mov_id=m.mov_id inner join ratings as r on r.mov_id=m.mov_id where rev_stars is not null;

#16. Write a query in SQL to find the movie title, actor first and last name, and the role for those movies where one or more actors acted in two or more movies. 
select mov_title, act_fname, act_lname, role from movie as m inner join movie_cast as mc on m.mov_id=mc.mov_id inner join actor as a on a.act_id=mc.act_id where a.act_id in (select act_id from movie_cast group by act_id having count(mov_id >=0));

#17. Write a query in SQL to find the first and last name of a director and the movie he or she directed, and the actress appeared which first name was Claire and last name was Danes along with her role in that movie.  
select dir_fname, dir_lname, mov_title,act_fname, act_lname, role from director as d inner join movie_direction as md on d.dir_id=md.dir_id inner join movie as m on md.mov_id=m.mov_id inner join movie_cast as mc on mc.mov_id=m.mov_id where act_fname='Claire' and act_lname='danes';

#18. Write a query in SQL to find the first and last name of an actor with their role in the movie which was also directed by themselve.
select act_fname, act_lname,role from actor as a inner join movie_cast as mc on a.act_id=mc.act_id inner join  movie_direction as md on md.mov_id=mc.mov_id inner join director as d on d.dir_id=md.dir_id where a.act_fname=d.dir_fname and a.act_lname=d.dir_lname;

#19. Write a query in SQL to find the cast list for the movie Chinatown. 
select act_id,act_fname, act_lname, mov_id, role from actor as a inner join movie_cast as mc on mc.act_id=a.act_id inner join movie as m on m.mov_id=mc.mov_id where movie_title='Chinatown';
SELECT a.act_fname, a.act_lname
FROM
movie_cast c
JOIN actor a ON
c.act_id = a.act_id
Where mov_id = (
SELECT mov_id
FROM movie
Where mov_title = 'Chinatown');

#20. Write a query in SQL to find the movie in which the actor appeared whose first and last name are 'Harrison' and 'Ford'
select mov_title from movie as m inner join movie_cast as mc on mc.mov_id=m.mov_id inner join actor as a on a.act_id=mc.act_id where m.fname='harrison'and m.lname='ford';
select mov_title from movie as m inner join movie_cast as mc on mc.mov_id=m.mov_id where mc.act_id in(select act_id from actor where m.fname='harrison'and m.lname='ford');

#21. Write a query in SQL to find the highest-rated movie, and report its title, year, rating, and releasing country.
select m.mov_title, m.mov_year, m.mov_rel_country, r.rev_stars from movie as m inner join rating as r on m.mov_id=r.mov_id where rev_stars=(select max(r.rev_stars) from rating);

#22. Write a query in SQL to find the highest-rated Mystery movie, and report the title, year, and rating.  
#select m.mov_title, m.mov_year, r.rev_stars from movie as m inner join movie_genres as mg on m.mov_id=mg.mov_id inner join genres as g on g.gen_id=mg.gen_id where m.mov_id in(select max(rev_stars) where g.genre_title='mystery');
SELECT mov_title, mov_year, rev_stars
FROM movie 
NATURAL JOIN movie_genres 
NATURAL JOIN genres 
NATURAL JOIN rating
where gen_title='mystery' and rev_stars >= (select rev_stars from rating natural join movie_genres natural join genres where gen_title='mystery');

#23. Write a query in SQL to generate a report which shows the year when most of the Mystery movies produces, and number of movies and their average rating
select mov_year,gen_title,count(gen_title), avg(rev_stars) from movie natural join movie_genres natural join genre natural join rating where gen_title = 'Mystery' group by mov_year, gen_title;

#24. Write a query in SQL to generate a report which contain the columns movie title, name of the female actor, year of the movie, role, movie genres, the director, date of release, and rating of that movie
select mov_title, concat(act_fname, act_lname) as female_actor, mov_year, role, genre_title, dir_fname, dir_lname, mov_dt_rel, rev_stars from movie 
NATURAL JOIN movie_cast
NATURAL JOIN actor
NATURAL JOIN movie_genres
NATURAL JOIN genres
NATURAL JOIN movie_direction
NATURAL JOIN director
NATURAL JOIN rating
WHERE act_gender='F';


