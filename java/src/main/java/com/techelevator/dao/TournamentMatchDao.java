package com.techelevator.dao;

import com.techelevator.model.TournamentMatch;

import java.util.List;

public interface TournamentMatchDao {

    void createTournamentMatch(TournamentMatch tournamentMatch);

    List<TournamentMatch> getTournamentMatchesByTournamentIdAndRound(int tournamentId, int round);

    void updateTournamentMatch(int winner, int tournamentMatchId);

    TournamentMatch getMatch(int tournamentId, int playerId);

}
