<script>
  import {
    initialStudyTime,
    initialAnimeTime,
    mode,
    iterations,
    autorun
  } from "../utils/timer-store";
  let open = 'close';
  let savedTimes = false
  const toggleSettingsVisibility = () => {
    //when the settings are closed we give it a timeout to run the animation and the we stop desplaying it
    if (open == 'open'){
        open = 'middle'
        setTimeout(() => {
            open ='close' 
        }, 400);
    }
    else{
        open = 'open';
    }
  }
  const saveTimes = () =>{
    localStorage.setItem('studytime', $initialStudyTime.toString())
    localStorage.setItem('animetime', $initialAnimeTime.toString())
    savedTimes = true
    setTimeout(()=>{
      savedTimes = false
    }, 2000)
  }
  const saveAutorun = () =>{
    localStorage.setItem('autorun', $autorun.toString())
  }

  
</script>
{#if open != 'close' }
  <section class= {open == 'open' ? ("settings menuIn" )
  : (open == 'close' ? "hidden" : 'settings menuOut')} >
    <div class={ open == 'open' ? "settingscontainer" : 'hidden'} >
        <div class="studytime">
            <h3>Study time:</h3>
            <input bind:value={$initialStudyTime} type="range" min="10" max="100" class="studytime" />
            <span>{$initialStudyTime} minutes</span>
        </div>
        <div class="breaktime">
            <h3>Break time:</h3>
            <input bind:value={$initialAnimeTime} type="range" min="5" max="60" class="animetime" />
            <span>{$initialAnimeTime} minutes</span>
        </div>
        <div class="savetime">
          <button on:click={saveTimes} disabled={savedTimes} class="savebtn">{savedTimes ? 'Times saved !' : 'Save current times'}</button>
        </div>
        <div class="autorun">
          <input name="setautorun" bind:checked={$autorun} on:change={saveAutorun} type="checkbox" />
          <label for = "setautorun">Autostart next timer</label>
        </div>
        <span class="iterations">
          Completed animedoros: {$iterations}
        </span>
    </div>
  </section>
{/if}
<div class="modecontainer">
  <h2 class="mode">{$mode}</h2>
  <div class="wrapper">
    <button class="menu" on:click={toggleSettingsVisibility}>
      <i
        class={open =='open' ? "fa fa-times-circle-o" : "fa fa-bars"}
        aria-hidden="true"
      />
    </button>
  </div>
</div>

<style>
  .menu {
    color: #fafaea;
    border: none;
    background-color: transparent;
    font-size: calc(2rem + 1vw);
    font-weight: 400;
    opacity: 0.6;
    z-index: 100;
    transition: 0.2s ease;
  }
  .menu:hover {
    transition: 0.2s ease;
    transform: scale(1.05);
  }
  .modecontainer {
    padding: 1rem;
    display: flex;
    justify-content: center;
    width: 90%;
    margin: 0 auto;
  }
  .wrapper {
    display: flex;
    justify-content: flex-end;
  }
  .mode {
    flex: 55%;
    font-weight: 800;
    font-family: "Lisu Bosa", serif;
    font-size: calc(2rem + 5vw);
    padding: 1rem;
    text-align: center;
    color: #fafaea;
    opacity: 0.5;
    transition: 0.2s ease;
  }
  .settings {
    position: absolute;
    z-index: 3;
    width: 50%;
    height: 100%;
    right: 0;
    top: 0;
    padding: 1rem;
    border-radius: 15px 0 0 15px;
    background-color: rgba(0,0,0,0.95);
    font-family: 'Poppins', sans-serif;
  } 
  .settingscontainer{
    height: 60%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: .3em;
    color: #fafaea;
    font-size: calc(0.5rem + 1vw);
    gap: 1rem;
    margin-top: 10vh;
  }
  .savetime{
    display: flex;
    flex-direction: column;
    font-size: 1.2rem;
    gap: calc(.5rem + 1vh);
  }
  .savebtn{
    padding:.4rem;
    width: 80%;
    background-color: rgba(0, 0, 0, 0.9);
    border-radius: 15px;
    color: white;
    transition: .2s ease;
    font-size: 1rem;
  }
  .savebtn:hover{
    transform: scale(0.99);
    transition: .2s ease;
  }
  label{
    font-size: 1.2rem;
  }
  .studytime, .breaktime, .iterations{
    width: 80%;
    display: flex;
    gap: calc(0.5vw - 0.2rem);
    flex-direction: column;
    font-size: 1.4rem;
  
    border-top: 1px solid gray;
    border-bottom: 1px solid gray;
    padding: .5rem;
  }
  .iterations{
    padding-top: 1rem;
    font-weight: 600;
  }
  input[type="range"]{
    width: 80%;
  }
  .studytime{
    accent-color: rgb(8, 125, 164);
  }
  .animetime{
    accent-color:orange; 
  }
  .hidden{
    display: none;
  }
  
  @media (max-width : 650px){
    .settings{
        width: 80%;
    }
  }
    @media (max-width : 400px){
    .settings{
        width: 100%;
        border-radius: 0;
    }
  }
  @media (max-height : 700px){
    .settingscontainer{
        max-width: 80%;
    }
  }
   @media (max-height : 460px){
    .settings{
        max-width: 80%;
        font-size: 0.5rem;
        padding: 0;
        padding-top: 12vh;
    }
    .studytime, .breaktime, .iterations{
      font-size: .8rem;
    }
  }
  .menuIn{
    animation: in 0.2s ease-in-out;
  }
  .menuOut{
    animation: out 0.6s ease-in-out;
  }
  @keyframes in {
    from {
        transform: translateX(100vw);
    }
    to{
        transform: translateX(0);
    }
  }
 @keyframes out {
    0% {
        transform: translateX(0);
    }
    50%{
        transform: translateX(100vw) ;

    }
    100%{
        transform: translateX(200vw) ;
    }
  }

</style>
