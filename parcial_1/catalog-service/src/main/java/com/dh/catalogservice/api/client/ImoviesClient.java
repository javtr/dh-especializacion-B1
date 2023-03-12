package com.dh.catalogservice.api.client;

import com.dh.catalogservice.api.configuration.LoadBalancerConfiguration;
import com.dh.catalogservice.domain.model.Movie;
import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;


@FeignClient("movie-service")
@LoadBalancerClient(name = "movie-service",configuration = LoadBalancerConfiguration.CustomLoadBalancerConfiguration.class)
public interface ImoviesClient {
    @GetMapping("/movies/{genre}")
    List<Movie> getMovieByGenre(@PathVariable String genre);

}
