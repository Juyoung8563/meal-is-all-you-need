CREATE TABLE animes (
    anime_id    varchar(255)    primary key,
    title       varchar(255)    unique not null,
    description varchar(255)    not null,
    created_at  timestamp default current_timestamp
);