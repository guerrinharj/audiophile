
const mobileMenu = () => {
  const burgerTag = document.querySelector('#menu-mobile')

  console.log(burgerTag)

  burgerTag.addEventListener('click', () => {
    console.log('foi')
  })
}

export default mobileMenu();
