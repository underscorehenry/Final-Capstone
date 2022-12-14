package com.techelevator.dao;

import com.techelevator.model.Player;

import java.util.List;

public interface PlayerDao {
    public Player getPlayer(int userId);

    public List<Player> getAllPlayers();

    Player getPlayerByUsername(String username);

    int getPlayerIdByUsername(String username);

    List <Player> getPlayersByTournamentId(int tournamentId);

    Integer updatePlayersWinsById(int wins, int playerId);

    Integer updatePlayersLossesById(int losses, int playerId);

    Player getPlayerByPlayerId(int playerId);
}
