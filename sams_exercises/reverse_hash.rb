require 'rspec'


def sentence_order sentence
  sentence.split.sort_by(&:length).join(" ")
end

describe 'Sentence Ordering' do
  it 'reverses the order of the sentence based on length' do
    sentence = "Sam is the man"
    answer = "is Sam the man"
    expect(sentence_order sentence).to eq(answer)
  end

  it 'reverses the order of the sentence based on length' do
    sentence = "This whole time I was wondering about it all"
    answer = "I it was all This time whole about wondering"
    expect(sentence_order sentence).to eq(answer)
  end

  it 'reverses the order of the sentence based on length' do
    sentence = "is this real"
    answer ="is this real"
    expect(sentence_order sentence).to eq(answer)
  end

  it 'reverses the order of the sentence based on length' do
    sentence = "You is"
    answer ="is You"
    expect(sentence_order sentence).to eq(answer)
  end
end
