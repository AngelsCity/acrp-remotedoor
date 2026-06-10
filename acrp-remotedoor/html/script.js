window.addEventListener('message', function (e) {
    if (e.data.type === "playSound") {
        const audio = new Audio(`sounds/${e.data.sound}.ogg`);
        audio.volume = e.data.volume || 0.7;
        audio.play();
    }
});
