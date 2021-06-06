from .models import Genre, Movie
from .serializers import GenreSerializer, MovieSerializer
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.reverse import reverse
from django_filters import FilterSet, DateFilter
from rest_framework import permissions
from .custompermission import IsOwnerOrReadOnly


class GenreList(generics.ListCreateAPIView):
    queryset = Genre.objects.all()
    serializer_class = GenreSerializer
    view_name = 'genre-list'
    filterset_fields = ['genre_name']
    ordering_fields = ['genre_name']
    search_fields = ['genre_name']


class GenreDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Genre.objects.all()
    serializer_class = GenreSerializer
    view_name = 'genre-detail'


class MovieFilter(FilterSet):
    min_date = DateFilter(field_name='release_date', lookup_expr='gte')
    max_date = DateFilter(field_name='release_date', lookup_expr='lte')

    class Meta:
        model = Movie
        fields = ['min_date', 'max_date']


class MovieList(generics.ListCreateAPIView):
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer
    view_name = 'movie-list'
    filter_class = MovieFilter
    # permission_classes = [IsOwnerOrReadOnly]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class MovieDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer
    view_name = 'movie-detail'
    # permission_classes = [IsOwnerOrReadOnly]
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class ApiRoot(generics.GenericAPIView):
    view_name = 'api-view'

    def get(self, request, *args, **kwargs):
        return Response({
            'genres': reverse(GenreList.view_name, request=request),
            'movies': reverse(MovieList.view_name, request=request)
        })
