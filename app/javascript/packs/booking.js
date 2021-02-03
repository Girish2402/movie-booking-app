const container = document.querySelector('.container');
const seats = document.querySelectorAll('.row .seat:not(.occupied)');
const count = document.getElementById('count');
const price = document.getElementById('price');

const movieSelect = document.getElementById('movie');
let ticketPrice = +movieSelect.value;

const populateUI = () => {
  const bookedSeats = JSON.parse($("#booked-seats").val());
  if (bookedSeats !== null && bookedSeats.length > 0) {
    seats.forEach((seat, index) => {
      if (bookedSeats.indexOf(index) > -1) {
        seat.classList.add('occupied');
      }
    });
  }

  // const selectedMovieIndex = localStorage.getItem('selectedMovieIndex');
  // const selectedMoviePrice = localStorage.getItem('selectedMoviePrice');

  // if (selectedMovieIndex !== null) {
  //   movieSelect.selectedIndex = selectedMovieIndex;
  // }

  // if (selectedMoviePrice !== null) {
  //   count.innerText = selectedSeats.length;
  //   price.innerText = selectedSeats.length * +selectedMoviePrice;
  // }
};

populateUI();

selectedMovie = (movieIndex, moviePrice) => {
  localStorage.setItem('selectedMovieIndex', movieIndex);
  localStorage.setItem('selectedMoviePrice', moviePrice);
};

const updateSelectedSeatsCount = () => {
  const selectedSeats = document.querySelectorAll('.row .selected');

  const seatsIndex = [...selectedSeats].map(seat => [...seats].indexOf(seat));

  localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));

  const selectedSeatsCount = selectedSeats.length;

  count.innerText = selectedSeatsCount;
  price.innerText = selectedSeatsCount * ticketPrice;
};

// Seat select event
container.addEventListener('click', e => {
  if (
    e.target.classList.contains('seat') &&
    !e.target.classList.contains('occupied')
  ) {
    e.target.classList.toggle('selected');

    updateSelectedSeatsCount();
  }
});

// Movie select event
movieSelect.addEventListener('change', e => {
  ticketPrice = +e.target.value;
  selectedMovie(e.target.selectedIndex, e.target.value);

  updateSelectedSeatsCount();
});

$('#book-seat').on('click', function(){
  updateSelectedSeatsCount();
  const selectedMoviePrice = document.getElementById('movie').value,
        selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));
  let confirmBox = confirm(`You have selected ${selectedSeats.length} seats for a price of ${selectedSeats.length * selectedMoviePrice}
                      Press "Ok" to confirm`);
  if (confirmBox == true) {
    let  formData = {
          "seats": localStorage.selectedSeats,
          "screening_id": $("#screening-id").val(),
      };
    $.ajax({
      url: '/bookings',
      method: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: formData,
    });
  } else {
    alert("you pressed Cancel")
  }
});

