#ifndef CPP_EXAMS_NBA_H
#define CPP_EXAMS_NBA_H

#include <iostream>
#include <string>

using namespace std;

class Performance {
public:
    Performance(size_t p, size_t r, size_t a);
    size_t getPoints() const;
    size_t getRebounds() const;
    size_t getAssists() const;
    void setPerformance(size_t p, size_t r, size_t a);

private:
    size_t points, rebounds;
    int assists;
};

bool operator<(const Performance& p1, const Performance& p2);
bool operator>(const Performance& p1, const Performance& p2);
std::ostream& operator<<(std::ostream& f, const Performance& p);

class Player {
public:
    string getNom() const { return nom; }
    string getPrenoms() const { return prenoms; }
    Performance getRegular() const { return regular; }
    bool isPlayoff() const { return playoff == nullptr; }
    Performance getPlayoff() const {
        if (!playoff) throw "error : player not in playoff";
        return *playoff;
    }
    void setPerformancePlayoff(const Performance &d);
    Player(const string &p, const string &n, const Performance &_regular) :
            nom(n), prenoms(p), regular(_regular) {}
    Player(const string &p, const string &n, const Performance &_regular,
           const Performance &_playoff);
    Player(const Player &p);
    ~Player() { delete playoff; }
    Player &operator=(const Player &p);

private:
    string prenoms;
    string nom;
    Performance regular;
    Performance *playoff = nullptr;
};

class Chemistry {
public:
    Chemistry() = default;
    ~Chemistry() { delete[] tab; }
    Chemistry(const Chemistry &) = delete;
    Chemistry operator=(const Chemistry &) = delete;
    void ajouterBuddy(const Player &p, const Player &s);

private:
    struct Buddy {
        const Player *premier = nullptr;
        const Player *second = nullptr;
        Buddy() = default;
        ~Buddy() = default;
        Buddy &operator=(const Buddy &) = default;
        Buddy(const Buddy &) = default;
        Buddy(const Player &p, const Player &s) : premier(&p), second(&s) {}
    };
    Buddy *tab = nullptr;
    size_t nb = 0, nbMax = 0;
    void enlargeTable();
};

class Team {
public:
    Team() = default;
    ~Team();
    Team(const Team &) = delete;
    Team &operator=(const Team &) = delete;
    void ajouterPlayer(const Player &p);
    const Player &getPlayer(const string &_prenoms, const string &_nom) const;
    Player &getPlayer(const string &_prenoms, const string &_nom);
    void addBuddies(const Player &p1, const Player &p2);

private:
    Player **players = nullptr;
    size_t nb = 0, nbMax = 0;
    Chemistry buddies;
    void enlargeTable();
};

#endif //CPP_EXAMS_NBA_H
