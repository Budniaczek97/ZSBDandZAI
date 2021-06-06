from rest_framework import serializers
from .models import Genre, Movie


class GenreSerializer(serializers.HyperlinkedModelSerializer):
    movies = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='movie-detail')

    class Meta:
        model = Genre
        fields = ['id', 'url', 'created_at', 'genre_name', 'movies']


class MovieSerializer(serializers.HyperlinkedModelSerializer):
    genre = serializers.SlugRelatedField(queryset=Genre.objects.all(), slug_field='genre_name')
    owner = serializers.ReadOnlyField(source='owner.username')

    class Meta:
        model = Movie
        fields = ['id', 'url', 'created_at', 'title', 'description', 'release_date', 'rating', 'number_of_ratings',
                  'movie_length', 'genre', 'owner']
