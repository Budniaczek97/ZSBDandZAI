from django.db import models


class Genre(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    genre_name = models.CharField(max_length=50, unique=True)

    class Meta:
        ordering = ('genre_name',)

    def __str__(self):
        return self.genre_name


class Movie(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=250)
    release_date = models.DateField()
    rating = models.IntegerField()
    number_of_ratings = models.IntegerField()
    movie_length = models.IntegerField()
    genre = models.ForeignKey(Genre, related_name='movies', on_delete=models.SET_NULL, null=True)
    owner = models.ForeignKey('auth.User', related_name='movies', on_delete=models.CASCADE)

    class Meta:
        ordering = ('title',)

    def __str__(self):
        return self.title + ' ' + str(self.rating)

# python manage.py makemigrations or python manage.py makemigrations movies
# python manage.py sqlmigrate movies 0001
# python manage.py migrate

# python manage.py runserver

# pytest
