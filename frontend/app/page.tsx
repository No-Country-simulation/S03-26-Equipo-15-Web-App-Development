import { roboto, bebas_neue } from "./ui/font";

const Page = () => {
    return (
        <div>
            <h1 className={`${bebas_neue.className} text-4xl text-center m-auto p-10`}>Bienvenido al Frontend</h1>
            <p className={`${roboto.className} text-lg text-center m-auto`}>Esta es una aplicacion web desarrollada con Next.js y Tailwind CSS</p>
        </div>
    );
};

export default Page;