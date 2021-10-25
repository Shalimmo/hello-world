
import Header from './components/header/Component';
import Footer from './components/footer/Component';
import Home from './pages/home/Component';

import './App.css';

function App() {
  return (
      <div className="container-fluid p-0">
        <Header />
        <Home />
        <Footer />
      </div>
    );
}

export default App;
