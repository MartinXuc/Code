#include "NBA.h"

Performance::Performance(size_t p, size_t r, size_t a) :
        points(p), rebounds(r), assists(a) {}

size_t Performance::getPoints() const {
    return points;
}

size_t Performance::getRebounds() const {
    return rebounds;
}

size_t Performance::getAssists() const {
    return assists;
}

void Performance::setPerformance(size_t p, size_t r, size_t a) {
    points = p;
    rebounds = r;
    assists = a;
}

bool operator<(const Performance &p1, const Performance &p2) {
    if (p1.getPoints() < p2.getPoints()) return true;
    if (p1.getPoints() > p2.getPoints()) return false;

    if (p1.getRebounds() < p2.getRebounds()) return true;
    if (p1.getRebounds() > p2.getRebounds()) return false;

    if (p1.getAssists() < p2.getAssists()) return true;
    if (p1.getAssists() > p2.getAssists()) return false;

    return false;
}

bool operator>(const Performance &p1, const Performance &p2) {
    return !(p1 < p2);
}

std::ostream &operator<<(std::ostream &f, const Performance &p) {
    f << p.getPoints() << " points, " << p.getRebounds()
      << " rebounds, " << p.getAssists() << " assists";
    return f;
}

Player::Player(const string &p, const string &n,
               const Performance &_regular, const Performance &_playoff) :
        Player(p, n, _regular) //nom(n), prenoms(p), regular(_regular) // alternative
{
    setPerformancePlayoff(_playoff);
}

void Player::setPerformancePlayoff(const Performance &_playoff) {
    playoff = new Performance(_playoff);
}

Player::Player(const Player &p) : prenoms(p.prenoms), nom(p.nom), regular(p.regular) {
    if (p.playoff)
        playoff = new Performance(*p.playoff);
}

Player &Player::operator=(const Player &p) {
    if (this != &p) {
        prenoms = p.prenoms;
        nom = p.nom;
        regular = p.regular;
        if (p.playoff) {
            if (!playoff) playoff = new Performance(*p.playoff);
            else *playoff = *p.playoff;
        } else {
            delete playoff;
            playoff = nullptr;
        }
    }
    return *this;
}

void Chemistry::ajouterBuddy(const Player &p, const Player &s) {
    if (nb == nbMax)
        enlargeTable();
    tab[nb++] = Buddy(p, s);
}

void Chemistry::enlargeTable() {
    Buddy *newtab = new Buddy[nbMax * 2 + 1];
    for (size_t i = 0; i < nb; i++) newtab[i] = tab[i];
    nbMax = nbMax * 2 + 1;
    auto old = tab;
    tab = newtab;
    delete[] old;
}

void Team::ajouterPlayer(const Player &p) {
    if (nb == nbMax) enlargeTable();
    players[nb++] = new Player(p);
}

const Player &Team::getPlayer(const string &_prenoms, const string &_nom) const {
    for (size_t i = 0; i < nb; i++)
        if (players[i]->getNom() == _nom && players[i]->getPrenoms() == _prenoms)
            return *players[i];
    throw "error : player not existing";
}

Player &Team::getPlayer(const string &_prenoms, const string &_nom) {
    for (size_t i = 0; i < nb; i++)
        if (players[i]->getNom() == _nom && players[i]->getPrenoms() == _prenoms)
            return *players[i];
    throw "error : player not existing";
}

Team::~Team() {
    for (size_t i = 0; i < nb; i++) delete players[i];
    delete[] players;
}

void Team::enlargeTable() {
    auto *newtab = new Player *[nbMax * 2 + 1];
    for (size_t i = 0; i < nb; i++) newtab[i] = players[i];
    nbMax = nbMax * 2 + 1;
    auto old = players;
    players = newtab;
    delete[] old;
}

void Team::addBuddies(const Player &p1, const Player &p2) {
    buddies.ajouterBuddy(p1, p2);
}

