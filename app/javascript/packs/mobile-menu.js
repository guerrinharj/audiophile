
const mobileMenu = () => {
  const burgerTag = document.querySelector('#menu-mobile')
  const closeTag = document.querySelector('#close-mobile')
  const mobileNavTag = document.querySelector('#mobilenav')

  burgerTag.addEventListener('click', (event) => {
    mobileNavTag.classList.add('open-mobile')
    event.preventDefault
  })

  closeTag.addEventListener('click', (event) => {
    mobileNavTag.classList.remove('open-mobile')
    event.preventDefault
  })
}

export { mobileMenu }
