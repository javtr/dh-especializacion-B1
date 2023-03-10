package com.dh.catalogservice.api.service;

import com.dh.catalogservice.domain.model.Movie;
import org.springframework.cloud.openfeign.FeignClient;

import java.util.List;


public interface ICatalogService {
    List<Movie> getMovieByGenre (String genre);
}
