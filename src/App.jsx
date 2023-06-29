import MainContent from './components/MainContent';

function App() {
  return (
    <>
      <header>
        <h1>Learn & Master DevOps - {import.meta.env.VITE_VERSION_INFO}</h1>
      </header>
      <MainContent />
    </>
  );
}

export default App;
