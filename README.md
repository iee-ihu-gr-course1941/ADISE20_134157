Table of Contents
=================
   * [Εγκατάσταση](#εγκατάσταση)
      * [Απαιτήσεις](#απαιτήσεις)
      * [Οδηγίες Εγκατάστασης](#οδηγίες-εγκατάστασης)
   * [Περιγραφή API](#περιγραφή-api)
      * [Methods](#methods)
         * [Board](#board)
            * [Ανάγνωση Board](#ανάγνωση-board)
            * [Αρχικοποίηση Board](#αρχικοποίηση-board)
         * [Piece](#piece)
            * [Ανάγνωση Θέσης/Piece](#ανάγνωση-θέσηςpiece)
            * [Μεταβολή Θέσης Piece](#μεταβολή-θέσης-piece)
         * [Player](#player)
            * [Ανάγνωση στοιχείων παίκτη](#ανάγνωση-στοιχείων-παίκτη)
            * [Καθορισμός στοιχείων παίκτη](#καθορισμός-στοιχείων-παίκτη)
         * [Dice](#dice)
            * [Ανάθεση τιμής ζαριών](#ανάθεση-τιμής-ζαριών)
         * [Status](#status)
            * [Ανάγνωση κατάστασης παιχνιδιού](#ανάγνωση-κατάστασης-παιχνιδιού)
      * [Entities](#entities)
         * [Board](#board-1)
         * [Players](#players)
         * [Game_status](#game_status)
         * [Posts](#posts)
      
# Demo Page

Μπορείτε να κατεβάσετε τοπικά ή να επισκευτείτε την σελίδα: [https://users.iee.ihu.gr/~it134157/adise20/ADISE20_134157/index.php](https://users.iee.ihu.gr/~it134157/adise20/ADISE20_134157/index.php)

# Εγκατάσταση

## Απαιτήσεις
- Apache2
- Mysql Server
- php

## Οδηγίες Εγκατάστασης
- Κάντε clone το project σε κάποιον φάκελο
``` bash
$ git clone https://github.com/iee-ihu-gr-course1941/ADISE20_134157.git
```
- Βεβαιωθείτε ότι ο φάκελος είναι προσβάσιμος από τον Apache Server. Πιθανόν να χρειαστεί να καθορίσετε τις παρακάτω ρυθμίσεις.

- Θα πρέπει να φτιάξετε το αρχείο lib/config_local.php το οποίο να περιέχει:

```php
<?php
    $DB_PASS = 'κωδικός';
    $DB_USER = 'όνομα χρήστη';
?>
```

- Όπου κωδικός και όνομα χρήστη, οι ρυθμίσεις του server σας.

# Περιγραφή Παιχνιδιού
Όταν ένα πούλι βρίσκεται μόνο του σε μια θέση ο αντίπαλος έχει το δικαίωμα να το «πλακώσει», και έτσι κάνει μια πόρτα. Ο κάθε παίχτης έχει το δικαίωμα να αρχίσει το μάζεμα όταν έχει φέρει όλα τα πούλια του στην περιοχή μαζέματος του και δεν του έχει πλακώσει κανένα πούλι του ο αντίπαλος. Αν κατά την διάρκεια του μαζέματος του πλακώσει κάποιο πούλι ο αντίπαλος τότε σταματάει το μάζεμα μέχρι να ελευθερωθεί το πούλι. Όταν ένας παίχτης πλακώσει την «μάνα» του αντιπάλου τότε το παιχνίδι είναι σχεδόν σίγουρο ότι χάνεται διπλό. Κι αυτό γιατί έχει το πλεονέκτημα στο μάζεμα να «σπάει» τα πούλια του πάνω στη μάνα μέχρι να μαζέψει και το τελευταίο. Η μόνη θεωρητικά μικρή πιθανότητα να λήξει το παιχνίδι με διαφορετικό αποτέλεσμα είναι κι ο αντίπαλος να πιάσει την μάνα του άλλου, που σημαίνει ότι δεν θα μπορέσει να μαζέψει ούτε ο ένας ούτε ο άλλος και έτσι θα έχουμε ισοπαλία. Από την άλλη αν ο ένας παίχτης αφήσει πιο γρήγορα την μάνα του άλλου τότε αυτόματα χάνει και το παιχνίδι διπλό.

# Συντελεστές
Προγραμματιστής: it134157

# Περιγραφή API

## Methods

### Board
#### Ανάγνωση Board
``` json
GET /board/
```
Επιστρέφει σε json την τρέχουσα μορφή του [Board](https://github.com/iee-ihu-gr-course1941/ADISE20_134157#board).

#### Αρχικοποίηση Board
``` json
POST /board/
```
Αρχικοποιεί το Board, δηλαδή το παιχνίδι. Γίνονται reset τα πάντα σε σχέση με το παιχνίδι. Επιστρέφει σε json την τρέχουσα μορφή του [Board](https://github.com/iee-ihu-gr-course1941/ADISE20_134157#board).

### Piece
#### Ανάγνωση Θέσης/Piece
``` json
GET /board/piece/:x/:y/
```
Επιστρέφει τα στοιχεία από το [Board](https://github.com/iee-ihu-gr-course1941/ADISE20_134157#board) με συντεταγμένες x,y. 

#### Μεταβολή Θέσης Piece(
``` json
PUT /board/piece/:x/:y/
```
Json Data:

| Field         | Description   | Required  |
| ------------- |:-------------:| -----:    |
| x             | Η νέα θέση x  | yes       |
| y             | Η νέα θέση y  | yes       |

Κάνει την κίνηση το piece από την θέση x,y στην νέα θέση. Προφανώς ελέγχεται η κίνηση αν είναι νόμιμη καθώς και αν είναι η σειρά του παίκτη να παίξει με βάση το token. Επιστρέφει τα στοιχεία από το [Board](https://github.com/iee-ihu-gr-course1941/ADISE20_134157#board) με συντεταγμένες x,y. Περιλαμβάνει το χρώμα του piece και τον τύπο.

### Player
#### Ανάγνωση στοιχείων παίκτη
``` json
GET /players/:p
```
Επιστρέφει σε json μορφή τα στοιχεία του παίκτη p ή όλων των παικτών αν παραληφθεί. Το p μπορεί να πάρει τιμές 'B' ή 'W'.

#### Καθορισμός στοιχείων παίκτη
``` json
PUT /players/:p
```
Json Data:
| Field         | Description   | Required  |
| ------------- |:-------------:| -----:    |
| username      | Το username για τον παίκτη p.  | yes       |
| color         | To χρώμα που επέλεξε ο παίκτης p.  | yes       |

Ορίζει το username του παίκτη p.

Επιστρέφει τα στοιχεία του παίκτη p και ένα token. Το token πρέπει να το χρησιμοποιεί ο παίκτης καθόλη τη διάρκεια του παιχνιδιού.

### Dice
#### Ανάθεση τιμής ζαριών
``` json
PUT /board/dice/:dice1/:dice2/
```
Ανάθεση τιμών μετά από το roll των ζαριών. 

### Status
#### Ανάγνωση κατάστασης παιχνιδιού
``` json
GET /status/
```
Επιστρέφει το στοιχείο [Game_status](https://github.com/iee-ihu-gr-course1941/ADISE20_134157#status) σε json μορφή.

## Entities
### Board
---
Το board είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:

| Attribute| Description   | Values|
| ------------- |:-------------:| -----:    |
| x | H συντεταγμένη x του τετραγώνου  | 1..24 |
| y | H συντεταγμένη y του τετραγώνου  | 1..15  |
| b_color | To χρώμα του τετραγώνου  | 'B','W' |
| piece_color | To χρώμα του piece  | 'B','W', null |
| piece | To piece (πούλι) που υπάρχει στο τετράγωνο  | yes |
| occupied by | To piece (πούλι) που έχει <<πλακώσει>> άλλο piece  | 1..15, null |
| moves | Πίνακας με τα δυνατά τετράγωνα (x,y) που μπορεί να μετακινηθεί το τρέχον πούλι. Αν δεν υπάρχει πούλι, ή δεν έχει κάνει login ο χρήστης, ή δεν έχει ξεκινήσει το παιχνίδι ή αν δεν υπάρχουν κινήσεις, τότε το πεδίο δεν υπάρχει.  | 1..15 |

### Players
---
O κάθε παίκτης έχει τα παρακάτω στοιχεία:
| Attribute| Description   | Values|
| ------------- |:-------------:| -----:    |
| username | Όνομα παίκτη  | String |
| piece_color |To χρώμα που παίζει ο παίκτης | 'B','W' |
| token | To κρυφό token του παίκτη. Επιστρέφεται μόνο τη στιγμή της εισόδου του παίκτη στο παιχνίδι  | HEX |
| last_action | Τελευταία αλλαγή/ενέργεια στην κατάσταση του παίκτη | timestamp|

### Game_status
---
H κατάσταση παιχνιδιού έχει τα παρακάτω στοιχεία:
| Attribute| Description   | Values|
| ------------- |:-------------:| -----:    |
| status | Κατάσταση | 'not active', 'initialized', 'started', 'ended', 'aborded' |
| p_turn |To χρώμα του παίκτη που παίζει | 'B','W', null |
| dice1 | Η τιμή του πρώτου ζαριού | 1..6, null |
| dice2 | Η τιμή του δεύτερου ζαριού | 1..6, null |
| result | To χρώμα του παίκτη που κέρδισε | 'B','W', null |
| last_change | Τελευταία αλλαγή/ενέργεια στην κατάσταση του παιχνιδιού | timestamp|

### Users
---
Ο κάθε χρήστης έχει τα παρακάτω στοιχεία:
| Attribute| Description   | Values|
| ------------- |:-------------:| -----:    |
| user_id | ID λογαριασμού χρήστη | int a_i |
| username | Όνομα λογαριασμού χρήστη| String |
| password | Κωδικός λογαριασμού χρήστη σε κρυπτογραφημένη μορφή | String |

Για να επισκεφθεί κανείς την αρχική σελίδα θα χρειαστεί να είναι κάτοχος ενός λογαριασμού. Η δημιουργία του λογαριασμού γίνεται μέσω του do_register.php, ενώ η είσοδος του χρήστη στη σελίδα μέσω του do_login.php.

### Posts
---
Το chat έχει τα παρακάτω στοιχεία:
| Attribute| Description   | Values|
| ------------- |:-------------:| -----:    |
| id | ID μηνύματος | int a_i |
| msg| Το περιεχόμενο του μηνύματος| String |
| username | Όνομα του αποστολέα | String |
| date | Η χρονική στιγμή που αποστάλθηκε το μήνυμα | timestamp | 
