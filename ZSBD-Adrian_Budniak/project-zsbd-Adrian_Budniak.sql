-- Adrian Budniak
-- ZSBD
-- Nr albumu: 141290
-- Projekt zaliczeniowy

-- 1.

DROP TABLE project_genres CASCADE CONSTRAINTS;

DROP TABLE project_directors CASCADE CONSTRAINTS;

DROP TABLE project_actors CASCADE CONSTRAINTS;

DROP TABLE project_movies CASCADE CONSTRAINTS;

DROP TABLE project_movie_actor CASCADE CONSTRAINTS;

CREATE TABLE project_genres (
    genre_id    INT
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1 )
    PRIMARY KEY,
    genre_name  VARCHAR2(50) NOT NULL
);

CREATE TABLE project_directors (
    director_id    INT
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1 )
    PRIMARY KEY,
    first_name     VARCHAR2(50) NOT NULL,
    last_name      VARCHAR2(50) NOT NULL,
    nationality    VARCHAR2(50),
    date_of_birth  DATE
);

CREATE TABLE project_actors (
    actor_id       INT
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1 )
    PRIMARY KEY,
    first_name     VARCHAR2(50) NOT NULL,
    last_name      VARCHAR2(50) NOT NULL,
    nationality    VARCHAR2(50),
    date_of_birth  DATE
);

CREATE TABLE project_movies (
    movie_id           INT
        GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1 )
    PRIMARY KEY,
    title              VARCHAR2(100) NOT NULL,
    description        VARCHAR2(250) NOT NULL,
    release_date       DATE,
    rating             INT,
    number_of_ratings  INT,
    movie_length       INT,
    director_id        INT,
    genre_id           INT,
    FOREIGN KEY ( director_id )
        REFERENCES project_directors ( director_id ),
    FOREIGN KEY ( genre_id )
        REFERENCES project_genres ( genre_id )
);

CREATE TABLE project_movie_actor (
    movie_id  INT,
    actor_id  INT,
    FOREIGN KEY ( movie_id )
        REFERENCES project_movies ( movie_id ),
    FOREIGN KEY ( actor_id )
        REFERENCES project_actors ( actor_id )
);

-- 2.

-- project_genres

INSERT INTO project_genres ( genre_name ) VALUES ( 'drama' );

INSERT INTO project_genres ( genre_name ) VALUES ( 'biographical' );

INSERT INTO project_genres ( genre_name ) VALUES ( 'psychological' );

INSERT INTO project_genres ( genre_name ) VALUES ( 'animation' );

INSERT INTO project_genres ( genre_name ) VALUES ( 'action' );

-- project_directors

INSERT INTO project_directors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Frank',
    'Darabont',
    'Hungarian',
    TO_DATE('28/01/1959', 'DD/MM/YYYY')
);

INSERT INTO project_directors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Olivier',
    'Nakache',
    'French',
    TO_DATE('15/04/1973', 'DD/MM/YYYY')
);

INSERT INTO project_directors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Milos',
    'Forman',
    'Czech',
    TO_DATE('18/02/1932', 'DD/MM/YYYY')
);

INSERT INTO project_directors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Rob',
    'Minkoff',
    'American',
    TO_DATE('11/08/1962', 'DD/MM/YYYY')
);

INSERT INTO project_directors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Christopher',
    'Nolan',
    'Briton',
    TO_DATE('30/07/1970', 'DD/MM/YYYY')
);

-- project_actors

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Morgan',
    'Freeman',
    'American',
    TO_DATE('01/06/1937', 'DD/MM/YYYY')
);

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Tim',
    'Robbins',
    'American',
    TO_DATE('16/10/1958', 'DD/MM/YYYY')
);

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Omar',
    'Sy',
    'French',
    TO_DATE('20/01/1978', 'DD/MM/YYYY')
);

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Francois',
    'Cluzet',
    'French',
    TO_DATE('21/09/1955', 'DD/MM/YYYY')
);

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Jack',
    'Nicholson',
    'American',
    TO_DATE('22/04/1937', 'DD/MM/YYYY')
);

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Louise',
    'Fletcher',
    'American',
    TO_DATE('22/07/1934', 'DD/MM/YYYY')
);

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Beyonce',
    'Knowles-Carter',
    'American',
    TO_DATE('04/09/1981', 'DD/MM/YYYY')
);

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Donald',
    'Glower',
    'American',
    TO_DATE('25/09/1983', 'DD/MM/YYYY')
);

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Christian',
    'Bale',
    'Briton',
    TO_DATE('30/01/1974', 'DD/MM/YYYY')
);

INSERT INTO project_actors (
    first_name,
    last_name,
    nationality,
    date_of_birth
) VALUES (
    'Heath',
    'Ledger',
    'Australian',
    TO_DATE('04/04/1979', 'DD/MM/YYYY')
);

-- project_movies

INSERT INTO project_movies (
    title,
    description,
    release_date,
    rating,
    number_of_ratings,
    movie_length,
    director_id,
    genre_id
) VALUES (
    'The Shawshank Redemption',
    'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
    TO_DATE('16/04/1995', 'DD/MM/YYYY'),
    88,
    895504,
    142,
    1,
    1
);

INSERT INTO project_movies (
    title,
    description,
    release_date,
    rating,
    number_of_ratings,
    movie_length,
    director_id,
    genre_id
) VALUES (
    'Intouchables',
    'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.',
    TO_DATE('23/09/2011', 'DD/MM/YYYY'),
    87,
    656082,
    112,
    2,
    2
);

INSERT INTO project_movies (
    title,
    description,
    release_date,
    rating,
    number_of_ratings,
    movie_length,
    director_id,
    genre_id
) VALUES (
    'One Flew Over the Cuckoos Nest',
    'A criminal pleads insanity and is admitted to a mental institution, where he rebels against the oppressive nurse and rallies up the scared patients.',
    TO_DATE('19/11/1975', 'DD/MM/YYYY'),
    85,
    390024,
    133,
    3,
    3
);

INSERT INTO project_movies (
    title,
    description,
    release_date,
    rating,
    number_of_ratings,
    movie_length,
    director_id,
    genre_id
) VALUES (
    'The Lion King',
    'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.',
    TO_DATE('12/06/1994', 'DD/MM/YYYY'),
    82,
    560977,
    89,
    4,
    4
);

INSERT INTO project_movies (
    title,
    description,
    release_date,
    rating,
    number_of_ratings,
    movie_length,
    director_id,
    genre_id
) VALUES (
    'The Dark Knight',
    'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    TO_DATE('12/06/1994', 'DD/MM/YYYY'),
    80,
    501733,
    152,
    5,
    5
);

-- project_movie_actor

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    1,
    1
);

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    1,
    2
);

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    2,
    3
);

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    2,
    4
);

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    3,
    5
);

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    3,
    6
);

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    4,
    7
);

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    4,
    8
);

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    5,
    9
);

INSERT INTO project_movie_actor (
    movie_id,
    actor_id
) VALUES (
    5,
    10
);

-- 3a. adding procedure 

CREATE OR REPLACE PROCEDURE add_project_generes (
    new_genre_name VARCHAR2
) IS
BEGIN
    INSERT INTO project_genres ( genre_name ) VALUES ( new_genre_name );

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    add_project_generes('comedy');
END;
/

CREATE OR REPLACE PROCEDURE add_project_directors (
    new_first_name     VARCHAR2,
    new_last_name      VARCHAR2,
    new_nationality    VARCHAR2,
    new_date_of_birth  DATE
) IS
BEGIN
    INSERT INTO project_directors (
        first_name,
        last_name,
        nationality,
        date_of_birth
    ) VALUES (
        new_first_name,
        new_last_name,
        new_nationality,
        new_date_of_birth
    );

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    add_project_directors('Stephen', 'Chbosky', 'American', TO_DATE('25/01/1970', 'DD/MM/YYYY'));
END;
/

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE add_project_actors (
    new_first_name     VARCHAR2,
    new_last_name      VARCHAR2,
    new_nationality    VARCHAR2,
    new_date_of_birth  DATE
) IS
BEGIN
    INSERT INTO project_actors (
        first_name,
        last_name,
        nationality,
        date_of_birth
    ) VALUES (
        new_first_name,
        new_last_name,
        new_nationality,
        new_date_of_birth
    );

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    add_project_actors('Jacob', 'Tremblay', 'Canadian', TO_DATE('05/10/2006', 'DD/MM/YYYY'));
    add_project_actors('Julia', 'Roberts', 'American', TO_DATE('28/10/1967', 'DD/MM/YYYY'));
END;
/

CREATE OR REPLACE PROCEDURE add_project_movies (
    new_title              VARCHAR2,
    new_description        VARCHAR2,
    new_release_date       DATE,
    new_rating             INT,
    new_number_of_ratings  INT,
    new_movie_length       INT,
    new_director_id        INT,
    new_genre_id           INT
) IS
BEGIN
    INSERT INTO project_movies (
        title,
        description,
        release_date,
        rating,
        number_of_ratings,
        movie_length,
        director_id,
        genre_id
    ) VALUES (
        new_title,
        new_description,
        new_release_date,
        new_rating,
        new_number_of_ratings,
        new_movie_length,
        new_director_id,
        new_genre_id
    );

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    add_project_movies('Wonder',
                      'Based on the New York Times bestseller, this movie tells the incredibly inspiring and heartwarming story of August Pullman, a boy with facial differences who enters the fifth grade, attending a mainstream elementary school for the first time',
                      TO_DATE('15/11/2017',
                       'DD/MM/YYYY'),
                      78,
                      116785,
                      113,
                      6,
                      6);
END;
/

CREATE OR REPLACE PROCEDURE add_project_movie_actor (
    new_movie_id  INT,
    new_actor_id  INT
) IS
BEGIN
    INSERT INTO project_movie_actor (
        movie_id,
        actor_id
    ) VALUES (
        new_movie_id,
        new_actor_id
    );

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    add_project_movie_actor(6, 11);
    add_project_movie_actor(6, 12);
END;
/

-- 3a&3d. updating procedure 

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE update_project_genres (
    new_genre_id  INT,
    new_genre_name   VARCHAR2
) IS
    my_exception_no_project_directors_updated EXCEPTION;
    PRAGMA exception_init ( my_exception_no_project_directors_updated, -20998 );
BEGIN
    UPDATE project_genres
    SET
        genre_name = new_genre_name
    WHERE
        genre_id = new_genre_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data remained unchanged ');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    update_project_genres(5, 'Action');
END;
/

CREATE OR REPLACE PROCEDURE update_project_directors (
    new_director_id    INT,
    new_first_name     VARCHAR2,
    new_last_name      VARCHAR2,
    new_nationality    VARCHAR2,
    new_date_of_birth  DATE
) IS
    my_exception_no_project_directors_updated EXCEPTION;
    PRAGMA exception_init ( my_exception_no_project_directors_updated, -20998 );
BEGIN
    UPDATE project_directors
    SET
        first_name = new_first_name,
        last_name = new_last_name,
        nationality = new_nationality,
        date_of_birth = new_date_of_birth
    WHERE
        director_id = new_director_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data remained unchanged ');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    update_project_directors(1, 'FRANK', 'Darabont', 'Hungarian', TO_DATE('28/01/1959',
                             'DD/MM/YYYY'));
END;
/

CREATE OR REPLACE PROCEDURE update_project_actors (
    new_actor_id       INT,
    new_first_name     VARCHAR2,
    new_last_name      VARCHAR2,
    new_nationality    VARCHAR2,
    new_date_of_birth  DATE
) IS
    my_exception_no_project_actors_updated EXCEPTION;
    PRAGMA exception_init ( my_exception_no_project_actors_updated, -20998 );
BEGIN
    UPDATE project_actors
    SET
        first_name = new_first_name,
        last_name = new_last_name,
        nationality = new_nationality,
        date_of_birth = new_date_of_birth
    WHERE
        actor_id = new_actor_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data remained unchanged ');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    update_project_actors(1, 'MORGAN', 'Freeman', 'American', TO_DATE('01/06/1937',
                          'DD/MM/YYYY'));
END;
/

CREATE OR REPLACE PROCEDURE update_project_movies (
    new_movie_id           INT,
    new_title              VARCHAR2,
    new_description        VARCHAR2,
    new_release_date       DATE,
    new_rating             INT,
    new_number_of_ratings  INT,
    new_movie_length       INT
) IS
    my_exception_no_project_movies_updated EXCEPTION;
    PRAGMA exception_init ( my_exception_no_project_movies_updated, -20998 );
BEGIN
    UPDATE project_movies
    SET
        title = new_title,
        description = new_description,
        release_date = new_release_date,
        rating = new_rating,
        number_of_ratings = new_number_of_ratings,
        movie_length = new_movie_length
    WHERE
        movie_id = new_movie_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data remained unchanged ');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    update_project_movies(1, 'THE Shawshank Redemption',
                         'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
                         TO_DATE('16/04/1995',
                          'DD/MM/YYYY'),
                         88,
                         895504,
                         142);
END;
/

-- 3a&3d. droping procedure 

CREATE OR REPLACE PROCEDURE delete_project_genres (
    delete_genre_id VARCHAR2
) IS
    my_exception_no_project_genres_deleted EXCEPTION;
    PRAGMA exception_init ( my_exception_no_project_genres_deleted, -20998 );
BEGIN
    DELETE FROM project_genres
    WHERE
        genre_id = delete_genre_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data has not been deleted');
    END IF;
EXCEPTION
    WHEN my_exception_no_project_genres_deleted THEN
        dbms_output.put_line(sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    delete_project_genres(88);
END;
/

CREATE OR REPLACE PROCEDURE delete_project_directors (
    delete_director_id VARCHAR2
) IS
    my_exception_no_project_directors_deleted EXCEPTION;
    PRAGMA exception_init ( my_exception_no_project_directors_deleted, -20998 );
BEGIN
    DELETE FROM project_directors
    WHERE
        director_id = delete_director_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data has not been deleted');
    END IF;
EXCEPTION
    WHEN my_exception_no_project_directors_deleted THEN
        dbms_output.put_line(sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    delete_project_directors(77);
END;
/

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE delete_project_actors (
    delete_actor_id VARCHAR2
) IS
    my_exception_no_project_actors_deleted EXCEPTION;
    PRAGMA exception_init ( my_exception_no_project_actors_deleted, -20998 );
BEGIN
    DELETE FROM project_actors
    WHERE
        actor_id = delete_actor_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data has not been deleted');
    END IF;
EXCEPTION
    WHEN my_exception_no_project_actors_deleted THEN
        dbms_output.put_line(sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    delete_project_actors(1313);
END;
/

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE delete_project_movies (
    delete_movie_id VARCHAR2
) IS
    my_exception_no_project_movies_deleted EXCEPTION;
    PRAGMA exception_init ( my_exception_no_project_movies_deleted, -20998 );
BEGIN
    DELETE FROM project_movies
    WHERE
        movie_id = delete_movie_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data has not been deleted');
    END IF;
EXCEPTION
    WHEN my_exception_no_project_movies_deleted THEN
        dbms_output.put_line(sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    delete_project_movies(77);
END;
/

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE delete_project_movie_actor (
    delete_movie_id  VARCHAR2,
    delete_actor_id  VARCHAR2
) IS
    my_exception_no_project_movie_actor_deleted EXCEPTION;
    PRAGMA exception_init ( my_exception_no_project_movie_actor_deleted, -20998 );
BEGIN
    DELETE FROM project_movie_actor
    WHERE
            movie_id = delete_movie_id
        AND actor_id = delete_actor_id;

    IF SQL%rowcount = 0 THEN
        raise_application_error(-20998, 'The data has not been deleted');
    END IF;
EXCEPTION
    WHEN my_exception_no_project_movie_actor_deleted THEN
        dbms_output.put_line(sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    delete_project_movie_actor(66, 1212);
END;
/

-- 3b.

CREATE TABLE project_genres_archive (
    genre_id     INT,
    genre_name   VARCHAR2(50) NOT NULL,
    archived_at  DATE
);

CREATE TABLE project_directors_archive (
    director_id    INT,
    first_name     VARCHAR2(50) NOT NULL,
    last_name      VARCHAR2(50) NOT NULL,
    nationality    VARCHAR2(50),
    date_of_birth  DATE,
    archived_at    DATE
);

CREATE TABLE project_actors_archive (
    actor_id       INT,
    first_name     VARCHAR2(50) NOT NULL,
    last_name      VARCHAR2(50) NOT NULL,
    nationality    VARCHAR2(50),
    date_of_birth  DATE,
    archived_at    DATE
);

CREATE TABLE project_movies_archive (
    movie_id           INT,
    title              VARCHAR2(100) NOT NULL,
    description        VARCHAR2(250) NOT NULL,
    release_date       DATE,
    rating             INT,
    number_of_ratings  INT,
    movie_length       INT,
    director_id        INT,
    genre_id           INT,
    archived_at        DATE
);

CREATE TABLE project_movie_actor_archive (
    movie_id     INT,
    actor_id     INT,
    archived_at  DATE
);

CREATE OR REPLACE TRIGGER archive_project_genres BEFORE
    DELETE ON project_genres
    FOR EACH ROW
BEGIN
    INSERT INTO project_genres_archive (
        genre_id,
        genre_name,
        archived_at
    ) VALUES (
        :old.genre_id,
        :old.genre_name,
        current_date
    );

END;

CREATE OR REPLACE TRIGGER archive_project_directors BEFORE
    DELETE ON project_directors
    FOR EACH ROW
BEGIN
    INSERT INTO project_directors_archive (
        director_id,
        first_name,
        last_name,
        nationality,
        date_of_birth,
        archived_at
    ) VALUES (
        :old.director_id,
        :old.first_name,
        :old.last_name,
        :old.nationality,
        :old.date_of_birth,
        current_date
    );

END;

CREATE OR REPLACE TRIGGER archive_project_actors BEFORE
    DELETE ON project_actors
    FOR EACH ROW
BEGIN
    INSERT INTO project_actors_archive (
        actor_id,
        first_name,
        last_name,
        nationality,
        date_of_birth,
        archived_at
    ) VALUES (
        :old.actor_id,
        :old.first_name,
        :old.last_name,
        :old.nationality,
        :old.date_of_birth,
        current_date
    );

END;

CREATE OR REPLACE TRIGGER archive_project_movies BEFORE
    DELETE ON project_movies
    FOR EACH ROW
BEGIN
    INSERT INTO project_movies_archive (
        movie_id,
        title,
        description,
        release_date,
        rating,
        number_of_ratings,
        movie_length,
        director_id,
        genre_id,
        archived_at
    ) VALUES (
        :old.movie_id,
        :old.title,
        :old.description,
        :old.release_date,
        :old.rating,
        :old.number_of_ratings,
        :old.movie_length,
        :old.director_id,
        :old.genre_id,
        current_date
    );

END;

CREATE OR REPLACE TRIGGER archive_project_movie_actor BEFORE
    DELETE ON project_movie_actor
    FOR EACH ROW
BEGIN
    INSERT INTO project_movie_actor_archive (
        movie_id,
        actor_id,
        archived_at
    ) VALUES (
        :old.movie_id,
        :old.actor_id,
        current_date
    );

END;

-- 3c.

CREATE TABLE logs (
    created_at   DATE,
    action_type  VARCHAR2(10),
    table_name   VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER project_genres_insert_log AFTER
    INSERT ON project_genres
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'INSERT',
        'project_genres'
    );

END;
/

CREATE OR REPLACE TRIGGER project_genres_update_log AFTER
    UPDATE ON project_genres
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'UPDATE',
        'project_genres'
    );

END;
/

CREATE OR REPLACE TRIGGER project_genres_delete_log AFTER
    DELETE ON project_genres
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'DELETE',
        'project_genres'
    );

END;
/

CREATE OR REPLACE TRIGGER project_directors_insert_log AFTER
    INSERT ON project_directors
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'INSERT',
        'project_directors'
    );

END;
/

CREATE OR REPLACE TRIGGER project_directors_update_log AFTER
    UPDATE ON project_directors
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'UPDATE',
        'project_directors'
    );

END;
/

CREATE OR REPLACE TRIGGER project_directors_delete_log AFTER
    DELETE ON project_directors
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'DELETE',
        'project_directors'
    );

END;
/

CREATE OR REPLACE TRIGGER project_actors_insert_log AFTER
    INSERT ON project_actors
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'INSERT',
        'project_actors'
    );

END;
/

CREATE OR REPLACE TRIGGER project_actors_update_log AFTER
    UPDATE ON project_actors
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'UPDATE',
        'project_actors'
    );

END;
/

CREATE OR REPLACE TRIGGER project_actors_delete_log AFTER
    DELETE ON project_actors
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'DELETE',
        'project_actors'
    );

END;
/

CREATE OR REPLACE TRIGGER project_movies_insert_log AFTER
    INSERT ON project_movies
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'INSERT',
        'project_movies'
    );

END;
/

CREATE OR REPLACE TRIGGER project_movies_update_log AFTER
    UPDATE ON project_movies
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'UPDATE',
        'project_movies'
    );

END;
/

CREATE OR REPLACE TRIGGER project_movies_delete_log AFTER
    DELETE ON project_movies
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'DELETE',
        'project_movies'
    );

END;
/

CREATE OR REPLACE TRIGGER project_movie_actor_insert_log AFTER
    INSERT ON project_movie_actor
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'INSERT',
        'project_movie_actor'
    );

END;
/

CREATE OR REPLACE TRIGGER project_movie_actor_update_log AFTER
    UPDATE ON project_movie_actor
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'UPDATE',
        'project_movie_actor'
    );

END;
/

CREATE OR REPLACE TRIGGER project_movie_actor_delete_log AFTER
    DELETE ON project_movie_actor
BEGIN
    INSERT INTO logs (
        created_at,
        action_type,
        table_name
    ) VALUES (
        current_date,
        'DELETE',
        'project_movie_actor'
    );

END;
/

-- 3d. Tak jak wcześniej zaznaczałem. Własne wyjątki dodawałem podczas robienia 3a.

-- 3e.

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE get_movie_title_with_highest_rating (
    out_movie_title OUT VARCHAR2
) IS
    get_result  VARCHAR2(100);
    cur         SYS_REFCURSOR;
BEGIN
    OPEN cur FOR 'SELECT
    title
FROM
    project_movies WHERE rating = (select MAX(rating)from project_movies)';

    FETCH cur INTO get_result;
    out_movie_title := get_result;
END;
/

DECLARE
    out_movie_title VARCHAR2(100);
BEGIN
    get_movie_title_with_highest_rating(out_movie_title);
    dbms_output.put_line(out_movie_title);
END;
/

SET SERVEROUT ON

CREATE OR REPLACE PROCEDURE get_actors_order_by_user_column (
    column_name VARCHAR2 DEFAULT 'first_name'
) IS
    one_record_value  VARCHAR2(5000);
    cur               SYS_REFCURSOR;
BEGIN
    OPEN cur FOR 'SELECT actor_id || '' '' || first_name || '' '' || last_name || '' '' || nationality || '' '' || date_of_birth as actors_info FROM project_actors order by ' ||
    column_name;

    LOOP
        FETCH cur INTO one_record_value;
        EXIT WHEN cur%notfound;
        dbms_output.put_line(one_record_value);
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('error code: ' || sqlcode);
        dbms_output.put_line('error message : ' || sqlerrm);
END;
/

BEGIN
    get_actors_order_by_user_column('last_name');
END;
/

BEGIN
    get_actors_order_by_user_column();
END;
/

-- 3f.

SET SERVEROUT ON

CREATE OR REPLACE FUNCTION is_valid_first_name (
    first_name_value VARCHAR2
) RETURN VARCHAR2 IS
BEGIN
    IF length(first_name_value) > 3 THEN
        RETURN 'true';
    ELSE
        RETURN 'false';
    END IF;
END;
/

DECLARE
    first_name VARCHAR2(50) := 'John';
BEGIN
    dbms_output.put_line(is_valid_first_name(first_name));
END;
/

DECLARE
    first_name VARCHAR2(50) := 'J';
BEGIN
    dbms_output.put_line(is_valid_first_name(first_name));
END;
/

SET SERVEROUT ON

CREATE OR REPLACE FUNCTION is_valid_rating (
    rating_value VARCHAR2
) RETURN VARCHAR2 IS
BEGIN
    IF rating_value > 100 THEN
        RETURN 'The rating is too high ';
    ELSE
        RETURN 'Is correct rating';
    END IF;
END;
/

DECLARE
    rating NUMBER := 150;
BEGIN
    dbms_output.put_line(is_valid_rating(rating));
END;
/

DECLARE
    rating NUMBER := 89;
BEGIN
    dbms_output.put_line(is_valid_rating(rating));
END;
/

-- 4a.



-- END