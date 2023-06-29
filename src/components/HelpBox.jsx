import './HelpBox.css';
import PropTypes from 'prop-types';

function HelpBox({ title, text }) {
  return (
    <article className="help-box">
      <h2>{title}</h2>
      <p>{text}</p>
    </article>
  );
}

HelpBox.propTypes = {
  title: PropTypes.string,
  text: PropTypes.string,
};

export default HelpBox;
