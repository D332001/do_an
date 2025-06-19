class InteractiveChatbox {
    constructor(a, b, c) {
        this.args = {
            button: a,
            chatbox: b
        }
        this.icons = c;
        this.state = false; 
    }

    display() {
        const {button, chatbox} = this.args;
        
        button.addEventListener('click', () => this.toggleState(chatbox))
    }

    toggleState(chatbox) {
        this.state = !this.state;
        this.showOrHideChatBox(chatbox, this.args.button);
    }

    showOrHideChatBox(chatbox, button) {
        if(this.state) {
            chatbox.classList.add('chatbox--active')
            this.toggleIcon(true, button);
        } else if (!this.state) {
            chatbox.classList.remove('chatbox--active')
            this.toggleIcon(false, button);
        }
    }

    toggleIcon(state, button) {
        const { isClicked, isNotClicked } = this.icons;
        let b = button.children[0].innerHTML;

        if(state) {
            button.children[0].innerHTML = isClicked; 
        } else if(!state) {
            button.children[0].innerHTML = isNotClicked;
        }
    }
}

const chatButton = document.querySelector('.chatbox__button');
const chatContent = document.querySelector('.chatbox__support');
const icons = {
    isClicked: '<img src="./images/icons/check.png" />',
    isNotClicked: '<img src="./images/icons/messenger.png" />'
}
const chatbox = new InteractiveChatbox(chatButton, chatContent, icons);
chatbox.display();
chatbox.toggleIcon(false, chatButton);

var mybutton = document.getElementById("myBtn");
        
        window.onscroll = function() {scrollFunction()};
        
        function scrollFunction() {
          if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
            mybutton.style.display = "block";
          } else {
            mybutton.style.display = "none";
          }
        }
        function topFunction() {
          document.body.scrollTop = 0;
          document.documentElement.scrollTop = 0;
        }