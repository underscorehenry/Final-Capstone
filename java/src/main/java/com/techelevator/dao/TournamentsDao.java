package com.techelevator.dao;

import com.techelevator.model.Tournaments;

import java.util.List;

public interface TournamentsDao {
    Tournaments getTournament(int id);

     Tournaments createTournament(Tournaments tournament);

     List<Tournaments> getAllTournaments();
}